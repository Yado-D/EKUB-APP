abstract interface class AuthRemoteDataSource {
  Future<String> registerUser({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  });

  Future<String> loginUser({
    required String username,
    required String password,
  });
}

class AuthRemoteDataSourceImplm implements AuthRemoteDataSource {
  @override
  Future<String> loginUser({
    required String username,
    required String password,
  }) async {
    try {
      Future.delayed(Duration(seconds: 5));
      return "you login Successfully";
    } catch (e) {
      return "Error while login user";
    }
  }

  @override
  Future<String> registerUser({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      Future.delayed(Duration(seconds: 5));
      return "you signup Successfully";
    } catch (e) {
      return "Error while signup user";
    }
  }
}
