import 'package:closet/core/domain/model/user.dart';
import 'package:closet/core/inherit/main_model.dart';
import 'package:closet/core/internal/locator.dart';
import 'package:closet/generated/l10n.dart';
import 'package:closet/presentation/navigation/route.dart';
import 'package:closet/presentation/widgets/part_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/src/provider.dart';

class MainView extends StatelessWidget {
  final User user;
  const MainView({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainModel>();
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Theme.of(context).primaryColorLight,
          Theme.of(context).primaryColorDark,
        ])),
        child: ListView(
          children: [
            Container(
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/box.svg",
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    S.of(context).closet,
                    style: Theme.of(context).textTheme.headline2!,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PartItem(
                        onTap: () => model.newOrder(context, user),
                        icon: Icon(
                          Icons.add,
                          color: Theme.of(context).textTheme.headline4!.color,
                          size: 60,
                        ),
                        title: S.of(context).new_1,
                      ),
                      PartItem(
                        onTap: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/order.svg",
                          color: Theme.of(context).textTheme.headline4!.color,
                          width: 60,
                          height: 60,
                        ),
                        title: S.of(context).orders,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PartItem(
                        onTap: () => model.openChat(context),
                        icon: SvgPicture.asset(
                          "assets/icons/chat.svg",
                          color: Theme.of(context).textTheme.headline4!.color,
                          width: 60,
                          height: 60,
                        ),
                        title: S.of(context).chat,
                      ),
                      PartItem(
                        onTap: () => model.openMapsSheet(context),
                        icon: SvgPicture.asset(
                          "assets/icons/location.svg",
                          color: Theme.of(context).textTheme.headline4!.color,
                          width: 60,
                          height: 60,
                        ),
                        title: S.of(context).map,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PartItem(
                        onTap: () => Navigator.of(context).pushNamed(
                            getIt.get<Profile>().route,
                            arguments: user),
                        icon: SvgPicture.asset(
                          "assets/icons/account.svg",
                          color: Theme.of(context).textTheme.headline4!.color,
                          width: 60,
                          height: 60,
                        ),
                        title: S.of(context).profile,
                      ),
                      const SizedBox(height: 140, width: 140),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
