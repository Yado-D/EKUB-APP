import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ekub_application/features/auth/domain/entities/user.dart';
import 'package:ekub_application/features/auth/domain/usecases/user_signin.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/user_signup.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignup _userSignup;
  final UserLogin _userLogin;

  AuthBloc({required UserSignup userSignup, required UserLogin userLogin})
      : _userSignup = userSignup,
        _userLogin = userLogin,
        super(AuthInitial()) {
    on<AuthSignin>(authSignin);
    on<AuthSignup>(authSignup);
  }

  FutureOr<void> authSignin(AuthSignin event, Emitter emit) async {
    emit(AuthLoading());
    print("on the login bloc function");
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 5));
    print("on the login bloc function after 5 second");
    final res = await _userLogin(
      UserLoginParams(
        username: event.username,
        password: event.password,
      ),
    );
    res.fold((onLeft) => emit(AuthFailure(onLeft.message)),
        (onRight) => emit(AuthSuccess(onRight)));
  }

  FutureOr<void> authSignup(AuthSignup event, Emitter emit) async {
    print("on the signup bloc function");
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 5));
    print("on the signup bloc function after 5 second");
    final res = await _userSignup(
      UserSignupParams(
        username: event.username,
        emial: event.email,
        phone: event.phone,
        password: event.password,
        confirmPassword: event.confirmPassword,
      ),
    );
    res.fold((onLeft) => emit(AuthFailure(onLeft.message)),
        (onRight) => emit(AuthSuccess(onRight)));
  }
}
