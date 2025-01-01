import 'package:onyx/core/api/end_ponits.dart';

class UserModel {

  final String email;
  final String password;

  UserModel({
    required this.email,
    required this.password,

  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      email: jsonData['user'][ApiKey.email],
      password: jsonData['user'][ApiKey.password],
    );
  }
}
