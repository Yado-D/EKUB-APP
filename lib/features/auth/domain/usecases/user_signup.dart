import 'package:ekub_application/core/error/failure.dart';
import 'package:ekub_application/core/usecases/usecase.dart';
import 'package:ekub_application/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserSignup implements UseCase<String, UserSignupParams> {
  AuthRepository authRepository;
  UserSignup(this.authRepository);

  @override
  Future<Either<Failure, String>> call(UserSignupParams params) async {
    return await authRepository.registerUser(
      username: params.username,
      email: params.emial,
      phone: params.phone,
      password: params.password,
      confirmPassword: params.confirmPassword,
    );
  }
}

class UserSignupParams {
  final String username;
  final String emial;
  final String phone;
  final String password;
  final String confirmPassword;

  UserSignupParams({
    required this.username,
    required this.emial,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });
}
