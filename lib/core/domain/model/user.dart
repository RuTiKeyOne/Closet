import 'package:equatable/equatable.dart';

import 'package:closet/core/domain/model/order.dart';

class User extends Equatable {
  final int? id;
  final String login;
  final String password;
  final String? telephone;
  final String? email;
  final List<Order>? orders;

  User({
    this.id,
    required this.login,
    required this.password,
    this.telephone,
    this.email,
    this.orders,
  });

  @override
  List<Object?> get props => [id, login, password, telephone, email];

  User copyWith({
    int? id,
    String? login,
    String? password,
    String? telephone,
    String? email,
    List<Order>? orders,
  }) {
    return User(
      id: id ?? this.id,
      login: login ?? this.login,
      password: password ?? this.password,
      telephone: telephone ?? this.telephone,
      email: email ?? this.email,
      orders: orders ?? this.orders,
    );
  }
}
