import 'package:closet/core/BLoC/cubit/chat_cubit/chat_cubit.dart';
import 'package:closet/core/domain/enums/order_enums.dart';
import 'package:closet/core/domain/model/message.dart';
import 'package:closet/core/internal/db_di/db_controller.dart';
import 'package:closet/core/internal/locator.dart';
import 'package:closet/generated/l10n.dart';
import 'package:closet/presentation/navigation/route.dart' as navigation;
import 'package:flutter/cupertino.dart';

import 'package:closet/core/domain/model/order.dart';
import 'package:closet/core/domain/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:open_file/open_file.dart';

class OrderDetailsModel extends ChangeNotifier {
  final ChatCubit chatCubit;

  final User user;
  final int index;
  final Order order;
  final DbController dbController;

  OrderDetailsModel({
    required this.chatCubit,
    required this.user,
    required this.index,
    required this.order,
    required this.dbController,
  });

  void backOnPressed(BuildContext context, User user) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        getIt.get<navigation.Orders>().route, (Route<dynamic> route) => false,
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

  void openContract() {
    OpenFile.open(order.contractPath!);
  }

  void openMapsSheet(BuildContext context) async {
    final coords = Coords(54.716823, 20.367838);
    final title = S.of(context).closet;
    final availableMaps = await MapLauncher.installedMaps;

    showModalBottomSheet(
      elevation: 10,
      backgroundColor: Theme.of(context).textTheme.headline1!.color,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Text(
                              S.of(context).back,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(fontSize: 16),
                            )),
                        Text(
                          S.of(context).map,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontSize: 16),
                        ),
                        TextButton(onPressed: () {}, child: const Text("")),
                      ],
                    ),
                  ),
                  for (var map in availableMaps)
                    ListTile(
                      onTap: () {
                        map.showMarker(
                          coords: coords,
                          title: title,
                        );
                        Navigator.of(context).pop();
                      },
                      title: Text(
                        map.mapName,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 18),
                      ),
                      leading: SvgPicture.asset(
                        map.icon,
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void openChangeStatusSheet(BuildContext context) async {
    showModalBottomSheet(
      elevation: 10,
      backgroundColor: Theme.of(context).textTheme.headline1!.color,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Text(
                              S.of(context).back,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(fontSize: 16),
                            )),
                        Text(
                          S.of(context).change_status,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontSize: 16),
                        ),
                        TextButton(onPressed: () {}, child: const Text("")),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ListTile(
                      onTap: () => updateTypeOrder(
                          orderStatus.theOrderHasBeenPlaced, context),
                      leading: SvgPicture.asset(
                        "assets/icons/location.svg",
                        width: 32,
                        height: 32,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      title: Text(
                        getOrderStatus(
                            context, orderStatus.theOrderHasBeenPlaced),
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ListTile(
                      onTap: () => updateTypeOrder(
                          orderStatus.thingsAreNotStock, context),
                      leading: SvgPicture.asset(
                        "assets/icons/not.svg",
                        width: 32,
                        height: 32,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      title: Text(
                        getOrderStatus(context, orderStatus.thingsAreNotStock),
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ListTile(
                      onTap: () =>
                          updateTypeOrder(orderStatus.thingsInStock, context),
                      leading: SvgPicture.asset(
                        "assets/icons/stock.svg",
                        width: 32,
                        height: 32,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      title: Text(
                        getOrderStatus(context, orderStatus.thingsInStock),
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ListTile(
                      onTap: () =>
                          updateTypeOrder(orderStatus.orderCompleted, context),
                      leading: SvgPicture.asset(
                        "assets/icons/completed.svg",
                        width: 32,
                        height: 32,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      title: Text(
                        getOrderStatus(context, orderStatus.orderCompleted),
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void updateTypeOrder(orderStatus type, BuildContext context) async {
    order.status = type;
    final Order updatedOrder = order;
    List<Order> updateOrders = user.orders ?? [];
    final updatedIndex =
        updateOrders.indexWhere((element) => element.id == order.id);
    updateOrders[updatedIndex] = updatedOrder;
    final User updatedUser = user.copyWith(orders: updateOrders);
    await dbController.update(updatedUser);
    notifyListeners();
    Navigator.of(context).pop();
  }

  void openBox(BuildContext context) {
    Navigator.of(context).pushNamed(getIt.get<navigation.OpenBox>().route);
  }

  void openVideoSirveilance(BuildContext context) {
    Navigator.of(context)
        .pushNamed(getIt.get<navigation.VideoSurveilance>().route);
  }

  void openChat(BuildContext context) {
    if (chatCubit.state is ChatView) {
      final state = (chatCubit.state as ChatView);
      final List<Message> messages = state.messages ?? [];
      if (messages.isEmpty) {
        chatCubit.emitNewMessage(
            state,
            Message(
                isUserMessage: false, message: S.of(context).welcome_message));
      }
    }
    Navigator.of(context).pushNamed(
      getIt.get<navigation.Chat>().route,
    );
  }
}
