import 'package:closet/core/internal/locator.dart';
import 'package:closet/generated/l10n.dart';
import 'package:closet/presentation/navigation/route.dart';
import 'package:closet/presentation/widgets/part_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColorLight,
                Theme.of(context).primaryColorDark,
              ]),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PartItem(
                  onTap: () {},
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PartItem(
                  onTap: () {},
                  icon: SvgPicture.asset(
                    "assets/icons/chat.svg",
                    color: Theme.of(context).textTheme.headline4!.color,
                    width: 60,
                    height: 60,
                  ),
                  title: S.of(context).chat,
                ),
                PartItem(
                  onTap: () {},
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PartItem(
                  onTap: () => Navigator.of(context)
                      .pushNamed(getIt.get<Profile>().route),
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
          ],
        ),
      ),
    ));
  }
}
