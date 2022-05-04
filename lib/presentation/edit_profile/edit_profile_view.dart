import 'package:closet/core/domain/model/user.dart';
import 'package:closet/core/inherit/edit_profile_model.dart';
import 'package:closet/core/internal/locator.dart';
import 'package:closet/generated/l10n.dart';
import 'package:closet/presentation/navigation/route.dart' as navigation;
import 'package:closet/presentation/widgets/elevated_button_type_one.dart';
import 'package:closet/presentation/widgets/text_form_field_type_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/src/provider.dart';

class EditProfileView extends StatelessWidget {
  final User user;
  final List<User> users;
  const EditProfileView({
    Key? key,
    required this.user,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<EditProfileModel>();
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushNamedAndRemoveUntil(
            getIt.get<navigation.Profile>().route,
            (Route<dynamic> route) => false,
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
                                          getIt.get<navigation.Profile>().route,
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
                              "assets/icons/edit.svg",
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            S.of(context).edit_profile,
                            style: Theme.of(context).textTheme.headline2!,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: Form(
                        key: model.formKey,
                        child: Column(
                          children: [
                            TextFormFieldTypeTwo(
                              controller: model.loginController,
                              label: S.of(context).login,
                              validator: (val) => model.loginValidator(
                                  val: val,
                                  context: context,
                                  users: users,
                                  user: user),
                              autofocus: true,
                              textInputAction: TextInputAction.next,
                              onTextChanged: (val) => model.loginValue = val,
                            ),
                            const SizedBox(height: 20),
                            TextFormFieldTypeTwo(
                              controller: model.passwordController,
                              label: S.of(context).password,
                              obscureText: true,
                              validator: (val) => model.passwordValidator(
                                  val: val, context: context),
                              textInputAction: TextInputAction.next,
                              onTextChanged: (val) => model.passwordValue = val,
                            ),
                            const SizedBox(height: 20),
                            TextFormFieldTypeTwo(
                              controller: model.telephoneController,
                              label: S.of(context).telephone,
                              validator: (val) => model.telephoneValidator(
                                  val: val, context: context),
                              textInputAction: TextInputAction.next,
                              onTextChanged: (val) =>
                                  model.telephoneValue = val,
                            ),
                            const SizedBox(height: 20),
                            TextFormFieldTypeTwo(
                              onFieldSubmitted: (val) =>
                                  model.save(user, context),
                              controller: model.emailController,
                              label: S.of(context).email,
                              validator: (val) => model.emailValidator(
                                  val: val, context: context),
                              textInputAction: TextInputAction.done,
                              onTextChanged: (val) => model.emailValue = val,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 30),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButtonTypeOne(
                          backgroundColor: Theme.of(context).primaryColorDark,
                          title: S.of(context).save,
                          onPressed: () => model.save(user, context),
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
