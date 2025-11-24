part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

// Login States
final class LoginLoading extends AuthenticationState {}
final class LoginSuccess extends AuthenticationState {}
final class LoginFailure extends AuthenticationState {
  final String message;
  LoginFailure({required this.message});
}

// SignUp States
final class SignUpLoading extends AuthenticationState {}
final class SignUpSuccess extends AuthenticationState {}
final class SignUpFailure extends AuthenticationState {
  final String message;
  SignUpFailure({required this.message});
}

// Logout States
final class LogoutLoading extends AuthenticationState {}
final class LogoutSuccess extends AuthenticationState {}
final class LogoutFailure extends AuthenticationState {
  final String message;
  LogoutFailure({required this.message});
}

// Reset Password States
final class ResetPasswordLoading extends AuthenticationState {}
final class ResetPasswordSuccess extends AuthenticationState {}
final class ResetPasswordFailure extends AuthenticationState {
  final String message;
  ResetPasswordFailure({required this.message});
}

// Add User Data States
final class AddUserDataLoading extends AuthenticationState {}
final class AddUserDataSuccess extends AuthenticationState {}
final class AddUserDataFailure extends AuthenticationState {
  final String message;
  AddUserDataFailure({required this.message});
}

// Get User Data States
final class GetUserDataLoading extends AuthenticationState {}
final class GetUserDataSuccess extends AuthenticationState {
  final UserModel userModel;  // ✅ اسمه userModel
  GetUserDataSuccess({required this.userModel});
}
final class GetUserDataFailure extends AuthenticationState {
  final String message;
  GetUserDataFailure(this.message);
}

// ✅ Update User Data States (جديدة)
final class UpdateUserDataLoading extends AuthenticationState {}
final class UpdateUserDataSuccess extends AuthenticationState {}
final class UpdateUserDataFailure extends AuthenticationState {
  final String message;
  UpdateUserDataFailure(this.message);
}