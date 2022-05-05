import 'dart:io';
import 'dart:math';

import 'package:closet/core/domain/enums/order_enums.dart';
import 'package:closet/core/domain/model/order.dart';
import 'package:closet/core/domain/model/user.dart';
import 'package:closet/core/internal/db_di/db_controller.dart';
import 'package:closet/core/internal/locator.dart';
import 'package:closet/presentation/navigation/route.dart' as navigator;
import 'package:file_picker/file_picker.dart';

import 'package:flutter/cupertino.dart';

class NewOrderModel extends ChangeNotifier {
  late Random rnd;
  late int cost;
  final DbController controller;
  String? contractPath;
  String? contractFileName;
  final orderType typeOrder;
  warehouseType typeWarehouse;
  double sizeValue;
  double weekValue;
  typeOfDeliveryToTheWarehouse typeDelivery;

  void changeTypeWareHouse(warehouseType type) {
    typeWarehouse = type;
    notifyListeners();
  }

  NewOrderModel({
    required this.controller,
    required this.typeOrder,
    required this.typeWarehouse,
    required this.typeDelivery,
    required this.sizeValue,
    required this.weekValue,
  }) {
    calculateCost();
    rnd = Random();
  }

  void retailPeriodChanged(double value) {
    weekValue = value;
    calculateCost();

    notifyListeners();
  }

  void typeDeliveryChanged(typeOfDeliveryToTheWarehouse typeDelivery) {
    this.typeDelivery = typeDelivery;
    notifyListeners();
  }

  void sizeOnChanged(double value) {
    sizeValue = value;
    calculateCost();
    notifyListeners();
  }

  void pickContact() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      contractFileName = result.files.first.name;
      contractPath = result.paths.first ?? "";
    }

    notifyListeners();
  }

  void deleleContact() {
    contractFileName = null;
    contractPath = null;
    notifyListeners();
  }

  void makeOrder(BuildContext context, User user) async {
    List<Order> updatedOrders = user.orders ?? [];
    final Order newOrder = Order(
        id: updatedOrders.length + 1,
        contractFileName: contractFileName,
        contractPath: contractPath,
        cost: cost,
        typeOrder: typeOrder,
        status: orderStatus.theOrderHasBeenPlaced,
        typeWarehouse: typeWarehouse,
        sizeValue: sizeValue.round(),
        weekValue: weekValue,
        typeDelivery: typeDelivery);
    updatedOrders.add(newOrder);
    User updatedUser = user.copyWith(orders: updatedOrders);
    await controller.update(updatedUser);
    backOnPressed(context, updatedUser);
  }

  void backOnPressed(BuildContext context, User user) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        getIt.get<navigator.Main>().route, (Route<dynamic> route) => false,
        arguments: user);
  }

  void calculateCost() {
    cost = ((sizeValue.round() * 294) + (weekValue.round() * 56)).toInt();
    notifyListeners();
  }
}
