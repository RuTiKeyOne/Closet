import 'package:closet/core/domain/enums/order_enums.dart';

class Order {
  final int cost;
  final orderType typeOrder;
  final orderStatus status;
  final String? contractPath;
  final String? contractFileName;
  final warehouseType typeWarehouse;
  final double sizeValue;
  final double weekValue;
  final typeOfDeliveryToTheWarehouse typeDelivery;

  Order({
    required this.cost,
    required this.typeOrder,
    required this.status,
    this.contractPath,
    this.contractFileName,
    required this.typeWarehouse,
    required this.sizeValue,
    required this.weekValue,
    required this.typeDelivery,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Order &&
        other.cost == cost &&
        other.typeOrder == typeOrder &&
        other.status == status &&
        other.contractPath == contractPath &&
        other.contractFileName == contractFileName &&
        other.typeWarehouse == typeWarehouse &&
        other.sizeValue == sizeValue &&
        other.weekValue == weekValue &&
        other.typeDelivery == typeDelivery;
  }

  @override
  int get hashCode {
    return cost.hashCode ^
        typeOrder.hashCode ^
        status.hashCode ^
        contractPath.hashCode ^
        contractFileName.hashCode ^
        typeWarehouse.hashCode ^
        sizeValue.hashCode ^
        weekValue.hashCode ^
        typeDelivery.hashCode;
  }

  Order copyWith({
    int? cost,
    orderType? typeOrder,
    orderStatus? status,
    String? contractPath,
    String? contractFileName,
    warehouseType? typeWarehouse,
    double? sizeValue,
    double? weekValue,
    typeOfDeliveryToTheWarehouse? typeDelivery,
  }) {
    return Order(
      cost: cost ?? this.cost,
      typeOrder: typeOrder ?? this.typeOrder,
      status: status ?? this.status,
      contractPath: contractPath ?? this.contractPath,
      contractFileName: contractFileName ?? this.contractFileName,
      typeWarehouse: typeWarehouse ?? this.typeWarehouse,
      sizeValue: sizeValue ?? this.sizeValue,
      weekValue: weekValue ?? this.weekValue,
      typeDelivery: typeDelivery ?? this.typeDelivery,
    );
  }
}
