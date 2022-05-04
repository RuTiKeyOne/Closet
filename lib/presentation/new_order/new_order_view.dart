import 'package:closet/core/domain/enums/order_enums.dart';
import 'package:closet/core/domain/model/user.dart';
import 'package:closet/core/inherit/new_order_model.dart';
import 'package:closet/generated/l10n.dart';
import 'package:closet/presentation/widgets/elevated_button_type_one.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class NewOrderView extends StatelessWidget {
  final User user;
  const NewOrderView({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NewOrderModel>();
    return WillPopScope(
      onWillPop: () async {
        model.backOnPressed(context, user);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Theme.of(context).primaryColorDark,
                              Theme.of(context).primaryColorLight,
                            ]),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: IconButton(
                                  onPressed: () =>
                                      model.backOnPressed(context, user),
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    size: 32,
                                    color: Theme.of(context).primaryColor,
                                  )),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: model.contractPath == null
                                    ? IconButton(
                                        onPressed: () => model.pickContact(),
                                        iconSize: 36,
                                        icon: const Icon(Icons.add),
                                        color:
                                            Theme.of(context).primaryColorDark,
                                      )
                                    : IconButton(
                                        onPressed: () => model.deleleContact(),
                                        iconSize: 36,
                                        icon: const Icon(Icons.delete),
                                        color:
                                            Theme.of(context).primaryColorDark,
                                      ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                model.contractFileName == null
                                    ? S.of(context).add_contract
                                    : model.contractFileName!,
                                style: Theme.of(context).textTheme.headline2!,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: SizedBox(
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Text(
                            S.of(context).tariff + ":",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(fontSize: 19),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            height: 45,
                            child: ElevatedButtonTypeOne(
                              backgroundColor: model.typeOrder == orderType.base
                                  ? Theme.of(context).primaryColorLight
                                  : Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .color!,
                              title: S.of(context).base,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).textTheme.headline5!.color,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).delivery_to_the_warehouse + ":",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(fontSize: 19),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              SizedBox(
                                height: 45,
                                child: ElevatedButtonTypeOne(
                                  backgroundColor: model.typeDelivery ==
                                          typeOfDeliveryToTheWarehouse.byYouself
                                      ? Theme.of(context).primaryColorLight
                                      : Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .color!,
                                  title: S.of(context).by_yourself,
                                  onPressed: () => model.typeDeliveryChanged(
                                      typeOfDeliveryToTheWarehouse.byYouself),
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                height: 45,
                                child: ElevatedButtonTypeOne(
                                  backgroundColor: model.typeDelivery ==
                                          typeOfDeliveryToTheWarehouse.staff
                                      ? Theme.of(context).primaryColorLight
                                      : Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .color!,
                                  title: S.of(context).staff,
                                  onPressed: () => model.typeDeliveryChanged(
                                      typeOfDeliveryToTheWarehouse.staff),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).textTheme.headline5!.color,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Text(
                            S.of(context).warehouse + ":",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(fontSize: 19),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            height: 45,
                            child: ElevatedButtonTypeOne(
                              backgroundColor:
                                  model.typeWarehouse == warehouseType.container
                                      ? Theme.of(context).primaryColorLight
                                      : Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .color!,
                              title: S.of(context).container,
                              onPressed: () => model
                                  .changeTypeWareHouse(warehouseType.container),
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            height: 45,
                            child: ElevatedButtonTypeOne(
                              backgroundColor:
                                  model.typeWarehouse == warehouseType.box
                                      ? Theme.of(context).primaryColorLight
                                      : Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .color!,
                              title: S.of(context).box,
                              onPressed: () =>
                                  model.changeTypeWareHouse(warehouseType.box),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).textTheme.headline5!.color,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Text(
                            S.of(context).size + ":",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(fontSize: 19),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 250,
                            child: Slider(
                              thumbColor: Theme.of(context).primaryColorDark,
                              activeColor: Theme.of(context).primaryColorDark,
                              inactiveColor:
                                  Theme.of(context).primaryColorLight,
                              min: 1,
                              max: 30,
                              divisions: 30,
                              label: model.sizeValue.round().toString() +
                                  " " +
                                  S.of(context).m_2,
                              value: model.sizeValue,
                              onChanged: model.sizeOnChanged,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).textTheme.headline5!.color,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).rental_period + ":",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(fontSize: 19),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 250,
                            child: Slider(
                              thumbColor: Theme.of(context).primaryColorDark,
                              activeColor: Theme.of(context).primaryColorDark,
                              inactiveColor:
                                  Theme.of(context).primaryColorLight,
                              min: 1,
                              max: 14,
                              divisions: 14,
                              label: model.weekValue.toStringAsFixed(0) +
                                  " " +
                                  S.of(context).week,
                              value: model.weekValue,
                              onChanged: model.retailPeriodChanged,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).textTheme.headline5!.color,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Text(
                            S.of(context).cost + ":",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(fontSize: 19),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            model.cost.toString() + " " + S.of(context).rub,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    fontSize: 22,
                                    color: Theme.of(context).primaryColorDark),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 30),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButtonTypeOne(
                          backgroundColor: Theme.of(context).primaryColorDark,
                          title: S.of(context).to_order,
                          onPressed: () => model.makeOrder(context, user),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
