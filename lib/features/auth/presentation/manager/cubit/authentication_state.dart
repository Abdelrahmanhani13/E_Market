part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class LoginLoading extends AuthenticationState {}
final class LoginSuccess extends AuthenticationState {}
final class LoginFailure extends AuthenticationState {
  final String message;
  LoginFailure({required this.message});
}

final class SignUpLoading extends AuthenticationState {}
final class SignUpSuccess extends AuthenticationState {}
final class SignUpFailure extends AuthenticationState {
  final String message;
  SignUpFailure({required this.message});
}

final class LogoutLoading extends AuthenticationState {}
final class LogoutSuccess extends AuthenticationState {}
final class LogoutFailure extends AuthenticationState {
  final String message;
  LogoutFailure({required this.message});
}

final class ResetPasswordLoading extends AuthenticationState {}
final class ResetPasswordSuccess extends AuthenticationState {}
final class ResetPasswordFailure extends AuthenticationState {
  final String message;
  ResetPasswordFailure({required this.message});
}