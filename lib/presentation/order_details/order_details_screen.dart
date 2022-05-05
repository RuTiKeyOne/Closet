import 'package:closet/core/BLoC/cubit/chat_cubit/chat_cubit.dart';
import 'package:closet/core/domain/model/order.dart';
import 'package:closet/core/domain/model/user.dart';
import 'package:closet/core/inherit/order_details_model.dart';
import 'package:closet/core/internal/db_di/db_controller.dart';
import 'package:closet/core/internal/locator.dart';
import 'package:closet/presentation/order_details/order_details_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final User user = arguments['user'] as User;
    final int index = arguments['index'] as int;
    final Order order = arguments['order'] as Order;
    return ChangeNotifierProvider(
      create: (context) => OrderDetailsModel(
        chatCubit: getIt.get<ChatCubit>(),
        dbController: getIt.get<DbController>(),
        user: user,
        index: index,
        order: order,
      ),
      child: const OrderDetailsView(),
    );
  }
}
