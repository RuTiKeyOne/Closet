import 'package:equatable/equatable.dart';

import 'package:closet/core/domain/model/order.dart';

class Message {
  final String message;
  final bool isUserMessage;
  final List<Order>? orders;

  Message({
    required this.message,
    required this.isUserMessage,
    this.orders,
  });

  Message copyWith({
    String? message,
    bool? isUserMessage,
    List<Order>? orders,
  }) {
    return Message(
      message: message ?? this.message,
      isUserMessage: isUserMessage ?? this.isUserMessage,
      orders: orders ?? this.orders,
    );
  }
}
