import 'package:closet/core/inherit/orders_model.dart';
import 'package:closet/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<OrdersModel>();
    return WillPopScope(
      onWillPop: () async {
        model.backOnPressed(context, model.user);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).primaryColorDark,
                  Theme.of(context).primaryColorLight,
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: IconButton(
                          onPressed: () =>
                              model.backOnPressed(context, model.user),
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 32,
                            color: Theme.of(context).primaryColor,
                          )),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        S.of(context).orders,
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontWeight: FontWeight.w200),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    itemCount: model.sortedOrders.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => model.openOrderDetails(
                            user: model.user,
                            order: model.sortedOrders[index],
                            index: index,
                            context: context),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).primaryColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).order +
                                      " " +
                                      model.sortedOrders[index].id.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(height: 10),
                                Wrap(
                                  runSpacing: 10,
                                  spacing: 5,
                                  children: [
                                    OrderDataItem(
                                        backgroundColor:
                                            Theme.of(context).primaryColorLight,
                                        title: model.getOrderStatus(context,
                                            model.sortedOrders[index].status)),
                                    OrderDataItem(
                                      backgroundColor:
                                          Theme.of(context).primaryColorDark,
                                      title: model.sortedOrders[index].cost
                                              .toString() +
                                          " " +
                                          S.of(context).rub,
                                    ),
                                    OrderDataItem(
                                      backgroundColor:
                                          Theme.of(context).primaryColorDark,
                                      title: model.sortedOrders[index].sizeValue
                                              .toStringAsFixed(0) +
                                          " " +
                                          S.of(context).m_2,
                                    ),
                                    OrderDataItem(
                                      backgroundColor:
                                          Theme.of(context).primaryColorLight,
                                      title: model.getTypeDelivery(
                                          context,
                                          model.sortedOrders[index]
                                              .typeDelivery),
                                    ),
                                    OrderDataItem(
                                      backgroundColor:
                                          Theme.of(context).primaryColorLight,
                                      title: model.getOrderType(context,
                                          model.sortedOrders[index].typeOrder),
                                    ),
                                    OrderDataItem(
                                      backgroundColor:
                                          Theme.of(context).primaryColorDark,
                                      title: model.getWareHouseType(
                                          context,
                                          model.user.orders![index]
                                              .typeWarehouse),
                                    ),
                                    OrderDataItem(
                                      backgroundColor:
                                          Theme.of(context).primaryColorDark,
                                      title: model.sortedOrders[index].weekValue
                                              .toStringAsFixed(0) +
                                          " " +
                                          S.of(context).week,
                                    ),
                                    model.sortedOrders[index].contractPath !=
                                                null &&
                                            model.sortedOrders[index]
                                                    .contractPath !=
                                                "" &&
                                            model.sortedOrders[index]
                                                .contractPath!.isNotEmpty
                                        ? OrderDataItem(
                                            backgroundColor: Theme.of(context)
                                                .primaryColorLight,
                                            title: model.sortedOrders[index]
                                                .contractFileName!,
                                          )
                                        : Container(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OrderDataItem extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  const OrderDataItem({
    Key? key,
    required this.title,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 16,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w300),
      ),
    );
  }
}
