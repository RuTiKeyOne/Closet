import 'dart:convert';

import 'package:closet/core/domain/enums/order_enums.dart';

class OrderModel {
  final int cost;
  final int typeOrderIndex;
  final int statusIndex;
  final String? contractPath;
  final String? contractFileName;
  final int typeWarehouseIndex;
  final double sizeValue;
  final double weekValue;
  final int typeDeliveryIndex;

  OrderModel({
    required this.cost,
    required this.typeOrderIndex,
    required this.statusIndex,
    this.contractPath,
    this.contractFileName,
    required this.typeWarehouseIndex,
    required this.sizeValue,
    required this.weekValue,
    required this.typeDeliveryIndex,
  });

  Map<String, dynamic> toMap() {
    return {
      'cost': cost,
      'typeOrderIndex': typeOrderIndex,
      'statusIndex': statusIndex,
      'contractPath': contractPath,
      'contractFileName': contractFileName,
      'typeWarehouseIndex': typeWarehouseIndex,
      'sizeValue': sizeValue,
      'weekValue': weekValue,
      'typeDeliveryIndex': typeDeliveryIndex,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      cost: map['cost']?.toInt() ?? 0,
      typeOrderIndex: map['typeOrderIndex']?.toInt() ?? 0,
      statusIndex: map['statusIndex']?.toInt() ?? 0,
      contractPath: map['contractPath'],
      contractFileName: map['contractFileName'],
      typeWarehouseIndex: map['typeWarehouseIndex']?.toInt() ?? 0,
      sizeValue: map['sizeValue']?.toDouble() ?? 0.0,
      weekValue: map['weekValue']?.toDouble() ?? 0.0,
      typeDeliveryIndex: map['typeDeliveryIndex']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));
}
