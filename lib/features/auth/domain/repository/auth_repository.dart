import 'package:ekub_application/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> registerUser({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  });

  Future<Either<Failure, String>> loginUser({
    required String username,
    required String password,
  });
}
