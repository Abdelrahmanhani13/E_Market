import 'package:bloc/bloc.dart';
import 'package:e_market/features/auth/data/models/user_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  SupabaseClient client = Supabase.instance.client;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await client.auth.signInWithPassword(email: email, password: password);
      emit(LoginSuccess());
    } on AuthException catch (e) {
      emit(LoginFailure(message: e.message));
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignUpLoading());
    try {
      await client.auth.signUp(email: email, password: password);
      await addUserData(name: name, email: email);
      emit(SignUpSuccess());
    } on AuthException catch (e) {
      emit(SignUpFailure(message: e.message));
    } catch (e) {
      emit(SignUpFailure(message: e.toString()));
    }
  }

  Future<void> signOut() async {
    emit(LogoutLoading());
    try {
      await client.auth.signOut();
      emit(LogoutSuccess());
    } on AuthException catch (e) {
      emit(LogoutFailure(message: e.message));
    } catch (e) {
      emit(LogoutFailure(message: e.toString()));
    }
  }

  Future<void> resetPassword({required String email}) async {
    emit(ResetPasswordLoading());
    try {
      await client.auth.resetPasswordForEmail(email);
      emit(ResetPasswordSuccess());
    } on AuthException catch (e) {
      emit(ResetPasswordFailure(message: e.message));
    } catch (e) {
      emit(ResetPasswordFailure(message: e.toString()));
    }
  }

  Future<void> addUserData({
    required String name,
    required String email,
  }) async {
    emit(AddUserDataLoading());
    try {
      await client.from('users').insert({
        'user_id': client.auth.currentUser!.id,
        'name': name,
        'email': email,
      });
      emit(AddUserDataSuccess());
    } on PostgrestException catch (e) {
      emit(AddUserDataFailure(message: e.message));
    } catch (e) {
      emit(AddUserDataFailure(message: e.toString()));
    }
  }

  // ✅ fetchUser مُصلح
  Future<void> fetchUser() async {
    try {
      emit(GetUserDataLoading());

      final userId = client.auth.currentUser?.id;
      if (userId == null) {
        emit(GetUserDataFailure('No user logged in'));
        return;
      }

      // ✅ استخدم user_id مش id
      final response = await client
          .from('users')
          .select()
          .eq('user_id', userId) // ✅ صح
          .single();

      final user = UserModel.fromJson(response);
      emit(GetUserDataSuccess(userModel: user)); // ✅ userModel
    } on PostgrestException catch (e) {
      emit(GetUserDataFailure(e.message));
    } catch (e) {
      emit(GetUserDataFailure(e.toString()));
    }
  }

  // ✅ updateUser مُصلح
  Future<void> updateUser(Map<String, dynamic> updates) async {
    try {
      emit(UpdateUserDataLoading()); // ✅ state خاص بالـ update

      final userId = client.auth.currentUser?.id;
      if (userId == null) {
        emit(UpdateUserDataFailure('No user logged in'));
        return;
      }

      // ✅ استخدم user_id مش id
      await client.from('users').update(updates).eq('user_id', userId); // ✅ صح

      // اجلب البيانات الجديدة
      await fetchUser();

      emit(UpdateUserDataSuccess()); // ✅ state للنجاح
    } on PostgrestException catch (e) {
      emit(UpdateUserDataFailure(e.message));
    } catch (e) {
      emit(UpdateUserDataFailure(e.toString()));
    }
  }
}
