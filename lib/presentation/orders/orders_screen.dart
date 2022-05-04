import 'package:closet/core/domain/model/user.dart';
import 'package:closet/core/inherit/orders_model.dart';
import 'package:closet/presentation/orders/orders_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;
    return ChangeNotifierProvider(
      create: (context) => OrdersModel(user: user),
      child: const OrdersView(),
    );
  }
}
