
import 'package:bloc/bloc.dart';
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
    }on AuthException catch (e) {
      emit(LoginFailure(message: e.message));
    }
     catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }

  Future<void> signUp({required String email, required String password , required String name}) async {
    emit(SignUpLoading());
    try {
      await client.auth.signUp(email: email, password: password);
      emit(SignUpSuccess());
    }on AuthException catch (e) {
      emit(SignUpFailure(message: e.message));
    }
     catch (e) {
      emit(SignUpFailure(message: e.toString()));
    }
  }

  Future<void> signOut() async {
    emit(LogoutLoading());
    try {
      await client.auth.signOut();
      emit(LogoutSuccess());
    }on AuthException catch (e) {
      emit(LogoutFailure(message: e.message));
    }
     catch (e) {
      emit(LogoutFailure(message: e.toString()));
    }
  }

  Future<void> resetPassword({required String email}) async {
    emit(ResetPasswordLoading());
    try {
      await client.auth.resetPasswordForEmail(email);
      emit(ResetPasswordSuccess());
    }on AuthException catch (e) {
      emit(ResetPasswordFailure(message: e.message));
    }
     catch (e) {
      emit(ResetPasswordFailure(message: e.toString()));
    }
  }
}
