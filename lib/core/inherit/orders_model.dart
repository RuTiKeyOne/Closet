import 'package:closet/core/domain/enums/order_enums.dart';
import 'package:closet/core/domain/model/order.dart';
import 'package:closet/core/internal/locator.dart';
import 'package:closet/generated/l10n.dart';
import 'package:closet/presentation/navigation/route.dart' as navigation;
import 'package:flutter/cupertino.dart';

import 'package:closet/core/domain/model/user.dart';

class OrdersModel extends ChangeNotifier {
  final User user;
  late final List<Order> sortedOrders;

  OrdersModel({
    required this.user,
  }) {
    sortedOrders = user.orders ?? [];
    sortedOrders.sort((a, b) => a.sizeValue.compareTo(b.sizeValue));
  }

  void backOnPressed(BuildContext context, User user) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        getIt.get<navigation.Main>().route, (Route<dynamic> route) => false,
        arguments: user);
  }

  String getOrderStatus(BuildContext context, orderStatus status) {
    switch (status) {
      case orderStatus.thingsInStock:
        return S.of(context).things_in_stock;
      case orderStatus.thingsAreNotStock:
        return S.of(context).things_are_not_in_stock;
      case orderStatus.theOrderHasBeenPlaced:
        return S.of(context).the_order_has_been_placed;
      case orderStatus.orderCompleted:
        return S.of(context).order_completed;
    }
  }

  String getTypeDelivery(
      BuildContext context, typeOfDeliveryToTheWarehouse typeDelivery) {
    switch (typeDelivery) {
      case typeOfDeliveryToTheWarehouse.byYouself:
        return S.of(context).by_yourself;

      case typeOfDeliveryToTheWarehouse.staff:
        return S.of(context).staff;
    }
  }

  String getOrderType(BuildContext context, orderType type) {
    switch (type) {
      case orderType.base:
        return S.of(context).base;
    }
  }

  String getWareHouseType(BuildContext context, warehouseType type) {
    switch (type) {
      case warehouseType.container:
        return S.of(context).container;
      case warehouseType.box:
        return S.of(context).box;
    }
  }
}
