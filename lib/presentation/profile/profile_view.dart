import 'package:closet/generated/l10n.dart';
import 'package:closet/presentation/widgets/profile_part_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
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
            ProfilePartItem(
              verticalPadding: 2.5,
              value: S.of(context).profile,
              postIcon: SvgPicture.asset(
                "assets/icons/account.svg",
                width: 36,
                height: 36,
                color: Theme.of(context).textTheme.headline4!.color,
              ),
            ),
            const SizedBox(height: 20),
            ProfilePartItem(
              value: "11",
              preIcon: SvgPicture.asset(
                "assets/icons/login.svg",
                width: 32,
                height: 32,
                color: Theme.of(context).textTheme.headline4!.color,
              ),
              postIcon: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
                iconSize: 32,
                color: Theme.of(context).textTheme.headline4!.color,
              ),
            ),
            const SizedBox(height: 20),
            ProfilePartItem(
              value: "11",
              preIcon: SvgPicture.asset(
                "assets/icons/password.svg",
                width: 32,
                height: 32,
                color: Theme.of(context).textTheme.headline4!.color,
              ),
              postIcon: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
                iconSize: 32,
                color: Theme.of(context).textTheme.headline4!.color,
              ),
            ),
            const SizedBox(height: 20),
            ProfilePartItem(
              value: "11",
              preIcon: SvgPicture.asset(
                "assets/icons/phone.svg",
                width: 32,
                height: 32,
                color: Theme.of(context).textTheme.headline4!.color,
              ),
              postIcon: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
                iconSize: 32,
                color: Theme.of(context).textTheme.headline4!.color,
              ),
            ),
            const SizedBox(height: 20),
            ProfilePartItem(
              value: "11",
              preIcon: SvgPicture.asset(
                "assets/icons/email.svg",
                width: 32,
                height: 32,
                color: Theme.of(context).textTheme.headline4!.color,
              ),
              postIcon: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
                iconSize: 32,
                color: Theme.of(context).textTheme.headline4!.color,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
