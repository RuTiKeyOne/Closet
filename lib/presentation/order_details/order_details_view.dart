import 'dart:io' as io;
import 'package:closet/core/domain/enums/order_enums.dart';
import 'package:closet/core/inherit/order_details_model.dart';
import 'package:closet/generated/l10n.dart';
import 'package:closet/presentation/orders/orders_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/src/provider.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<OrderDetailsModel>();
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
                        S.of(context).order +
                            " " +
                            (model.index + 1).toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontWeight: FontWeight.w200),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).accentColor.withOpacity(0.3),
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
                            S.of(context).status,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 20, fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OrderDataItem(
                                  backgroundColor:
                                      Theme.of(context).primaryColorLight,
                                  title: model.getOrderStatus(
                                      context, model.order.status)),
                              model.order.typeDelivery ==
                                      typeOfDeliveryToTheWarehouse.byYouself
                                  ? GestureDetector(
                                      onTap: () =>
                                          model.openChangeStatusSheet(context),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
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
                                        child: Icon(
                                          Icons.edit,
                                          size: 24,
                                          color: Theme.of(context)
                                              .primaryColorLight,
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  model.order.contractPath != null &&
                          model.order.contractPath != "" &&
                          model.order.contractPath!.isNotEmpty &&
                          io.File(model.order.contractPath!).existsSync()
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
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
                                  S.of(context).contract,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    OrderDataItem(
                                        backgroundColor:
                                            Theme.of(context).primaryColorLight,
                                        title: model.order.contractFileName!),
                                    GestureDetector(
                                      onTap: () => model.openContract(),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
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
                                        child: Icon(
                                          Icons.folder_open_sharp,
                                          size: 24,
                                          color: Theme.of(context)
                                              .primaryColorLight,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  model.order.contractPath != null &&
                          model.order.contractPath != "" &&
                          model.order.contractPath!.isNotEmpty &&
                          io.File(model.order.contractPath!).existsSync()
                      ? const SizedBox(height: 20)
                      : Container(),
                  model.order.typeOrder == orderType.base
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
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
                                  S.of(context).what_is_included,
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
                                        title: S.of(context).box_rental),
                                    OrderDataItem(
                                        backgroundColor:
                                            Theme.of(context).primaryColorDark,
                                        title: S.of(context).castle),
                                    OrderDataItem(
                                        backgroundColor:
                                            Theme.of(context).primaryColorLight,
                                        title: S.of(context).seal),
                                    OrderDataItem(
                                        backgroundColor:
                                            Theme.of(context).primaryColorDark,
                                        title: S.of(context).security),
                                    OrderDataItem(
                                        backgroundColor:
                                            Theme.of(context).primaryColorLight,
                                        title:
                                            S.of(context).video_surveillance),
                                    OrderDataItem(
                                        backgroundColor:
                                            Theme.of(context).primaryColorDark,
                                        title: S
                                            .of(context)
                                            .access_to_boxing_24_7),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  model.order.typeOrder == orderType.base
                      ? const SizedBox(height: 20)
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () => model.openVideoSirveilance(context),
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
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
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/cctv.svg",
                                        width: 64,
                                        height: 64,
                                        color:
                                            Theme.of(context).primaryColorLight,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        S.of(context).video_surveillance,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () => model.openBox(context),
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
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
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/open-lock.svg",
                                        width: 64,
                                        height: 64,
                                        color:
                                            Theme.of(context).primaryColorLight,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        S.of(context).open_box,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () => model.openMapsSheet(context),
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
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
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/location.svg",
                                        width: 64,
                                        height: 64,
                                        color:
                                            Theme.of(context).primaryColorLight,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        S.of(context).map,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        model.order.typeDelivery !=
                                typeOfDeliveryToTheWarehouse.byYouself
                            ? Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                    onTap: () => model.openChat(context),
                                    child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
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
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/chat.svg",
                                              width: 64,
                                              height: 64,
                                              color: Theme.of(context)
                                                  .primaryColorLight,
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              S.of(context).chat,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w300),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Expanded(
                                child: Container(),
                              ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
