import 'dart:convert';

class UserModel {
  int? id;
  String login;
  String password;

  UserModel({this.id, required this.login, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'login': login,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt(),
      login: map['login'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
