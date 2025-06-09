part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  String data;
  AuthSuccess(this.data);
}

final class AuthFailure extends AuthState {
  String message;
  AuthFailure(this.message);
}



