import 'package:ekub_application/core/error/exception.dart';
import 'package:ekub_application/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> registerUser({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  });

  Future<UserModel> loginUser({
    required String username,
    required String password,
  });
}

class AuthRemoteDataSourceImplm implements AuthRemoteDataSource {
  @override
  Future<UserModel> loginUser({
    required String username,
    required String password,
  }) async {
    try {
      Future.delayed(Duration(seconds: 2));
      return UserModel(
        username: username,
        email: "defoult@gmail.com",
        phone: "090000000",
        password: password,
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> registerUser({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      Future.delayed(Duration(seconds: 2));
      return UserModel(
        username: username,
        email: email,
        phone: phone,
        password: password,
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
