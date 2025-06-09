part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthSignup extends AuthEvent {
  String username;
  String email;
  String phone;
  String password;
  String confirmPassword;

  AuthSignup({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });
}

class AuthSignin extends AuthEvent {
  String username;
  String password;

  AuthSignin({
    required this.username,
    required this.password,
  });
}
