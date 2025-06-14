import 'package:ekub_application/core/error/failure.dart';
import 'package:ekub_application/core/usecases/usecase.dart';
import 'package:ekub_application/features/auth/domain/entities/user.dart';
import 'package:ekub_application/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserLogin implements UseCase<User, UserLoginParams> {
  AuthRepository authRepository;

  UserLogin(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserLoginParams params) async {
    return await authRepository.loginUser(
      username: params.username,
      password: params.password,
    );
  }
}

class UserLoginParams {
  final String username;
  final String password;

  UserLoginParams({
    required this.username,
    required this.password,
  });
}
