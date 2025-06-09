import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.username,
    required super.email,
    required super.phone,
    required super.password,
  });

  factory UserModel.toJson(Map<String, dynamic> json) {
    return UserModel(
      username: json["username"],
      email: json["email"],
      phone: json["phone"],
      password: json["password"],
    );
  }
}
