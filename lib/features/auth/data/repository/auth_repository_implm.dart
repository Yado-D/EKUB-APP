import 'package:ekub_application/core/error/failure.dart';
import 'package:ekub_application/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:ekub_application/features/auth/data/models/user_model.dart';
import 'package:ekub_application/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImplm implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImplm(this.authRemoteDataSource);

  @override
  Future<Either<Failure, UserModel>> loginUser({
    required String username,
    required String password,
  }) async {
    try {
      final res = await authRemoteDataSource.loginUser(
        username: username,
        password: password,
      );
      return right(res);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> registerUser({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final res = await authRemoteDataSource.registerUser(
        username: username,
        email: email,
        phone: phone,
        password: password,
        confirmPassword: confirmPassword,
      );
      return right(res);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
