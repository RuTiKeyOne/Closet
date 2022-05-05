import 'dart:convert';

import 'package:closet/core/domain/enums/order_enums.dart';

class OrderModel {
  final int id;
  final int cost;
  final int typeOrderIndex;
  final int statusIndex;
  final String? contractPath;
  final String? contractFileName;
  final int typeWarehouseIndex;
  final int sizeValue;
  final double weekValue;
  final int typeDeliveryIndex;

  OrderModel({
    required this.id,
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
      'id': id,
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
      id: map['id']?.toInt() ?? 0,
      cost: map['cost']?.toInt() ?? 0,
      typeOrderIndex: map['typeOrderIndex']?.toInt() ?? 0,
      statusIndex: map['statusIndex']?.toInt() ?? 0,
      contractPath: map['contractPath'],
      contractFileName: map['contractFileName'],
      typeWarehouseIndex: map['typeWarehouseIndex']?.toInt() ?? 0,
      sizeValue: map['sizeValue']?.toInt() ?? 0,
      weekValue: map['weekValue']?.toDouble() ?? 0.0,
      typeDeliveryIndex: map['typeDeliveryIndex']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));
}
