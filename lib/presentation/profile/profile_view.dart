import 'package:closet/core/domain/model/user.dart';
import 'package:closet/core/internal/locator.dart';
import 'package:closet/generated/l10n.dart';
import 'package:closet/presentation/navigation/route.dart' as navigation;
import 'package:closet/presentation/widgets/elevated_button_type_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileView extends StatelessWidget {
  final User user;
  const ProfileView({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushNamedAndRemoveUntil(
            getIt.get<navigation.Main>().route, (Route<dynamic> route) => false,
            arguments: user);
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
                      height: 230,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Theme.of(context).primaryColorLight,
                              Theme.of(context).primaryColorDark,
                            ]),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: IconButton(
                                  onPressed: () => Navigator.of(context)
                                      .pushNamedAndRemoveUntil(
                                          getIt.get<navigation.Main>().route,
                                          (Route<dynamic> route) => false,
                                          arguments: user),
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    size: 32,
                                    color: Theme.of(context).primaryColor,
                                  )),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/account.svg",
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            user.login,
                            style: Theme.of(context).textTheme.headline2!,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/password.svg",
                            width: 48,
                            height: 48,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          const SizedBox(width: 20, height: 20),
                          Text(
                            user.password.replaceAll(RegExp(r"."), "*"),
                            style: Theme.of(context).textTheme.headline5!,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).textTheme.headline5!.color,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/phone.svg",
                            width: 48,
                            height: 48,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          const SizedBox(width: 20, height: 20),
                          Text(
                            user.telephone != null && user.telephone!.isNotEmpty
                                ? user.telephone!
                                : S.of(context).no,
                            style: Theme.of(context).textTheme.headline5!,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).textTheme.headline5!.color,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/email.svg",
                            width: 48,
                            height: 48,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          const SizedBox(width: 20, height: 20),
                          Text(
                            user.email != null && user.email!.isNotEmpty
                                ? user.email!
                                : S.of(context).no,
                            style: Theme.of(context).textTheme.headline5!,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).textTheme.headline5!.color,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButtonTypeOne(
                                backgroundColor:
                                    Theme.of(context).primaryColorDark,
                                title: S.of(context).edit_profile,
                                onPressed: () => Navigator.of(context)
                                    .pushNamedAndRemoveUntil(
                                        getIt
                                            .get<navigation.EditProfile>()
                                            .route,
                                        (Route<dynamic> route) => false,
                                        arguments: user),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButtonTypeOne(
                                backgroundColor:
                                    Theme.of(context).primaryColorLight,
                                title: S.of(context).sign_out,
                                onPressed: () => Navigator.of(context)
                                    .pushNamedAndRemoveUntil(
                                  getIt.get<navigation.Authorization>().route,
                                  (Route<dynamic> route) => false,
                                ),
                              ),
                            ),
                          ),
                        ],
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
