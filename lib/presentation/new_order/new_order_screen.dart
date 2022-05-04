import 'package:closet/core/BLoC/cubit/new_order/new_order_cubit.dart' as cubit;
import 'package:closet/core/domain/enums/order_enums.dart';
import 'package:closet/core/domain/model/user.dart';
import 'package:closet/core/inherit/new_order_model.dart';
import 'package:closet/core/internal/db_di/db_controller.dart';
import 'package:closet/core/internal/locator.dart';
import 'package:closet/presentation/new_order/new_order_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class NewOrderScreen extends StatelessWidget {
  const NewOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;
    return BlocBuilder<cubit.NewOrderCubit, cubit.NewOrderState>(
      builder: (context, state) {
        if (state is cubit.NewOrderView) {
          return ChangeNotifierProvider(
            create: (context) => NewOrderModel(
              controller: getIt.get<DbController>(),
              typeOrder: orderType.base,
              typeWarehouse: warehouseType.container,
              typeDelivery: typeOfDeliveryToTheWarehouse.byYouself,
              sizeValue: 1,
              weekValue: 1,
            ),
            child: NewOrderView(
              user: user,
            ),
          );
        }
        return Container();
      },
    );
  }
}
