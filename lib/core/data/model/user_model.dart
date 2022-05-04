import 'dart:convert';

import 'package:closet/core/data/model/order_model.dart';
import 'package:closet/core/domain/model/order.dart';

class UserModel {
  int? id;
  String login;
  String password;
  String? telephone;
  String? email;
  List<OrderModel>? orders;

  UserModel({
    this.id,
    required this.login,
    required this.password,
    this.telephone,
    this.email,
    this.orders,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'login': login,
      'password': password,
      'telephone': telephone,
      'email': email,
      'orders': json.encode(orders?.map((x) => x.toMap()).toList()),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt(),
      login: map['login'] ?? '',
      password: map['password'] ?? '',
      telephone: map['telephone'],
      email: map['email'],
      orders: map['orders'] != null
          ? (jsonDecode(map["orders"]) as List)
              .map((data) => OrderModel.fromMap(data))
              .toList()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
