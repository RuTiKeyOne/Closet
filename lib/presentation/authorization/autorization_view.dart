import 'package:closet/core/inherit/authorization_model.dart';
import 'package:closet/core/internal/locator.dart';
import 'package:closet/generated/l10n.dart';
import 'package:closet/presentation/navigation/route.dart';
import 'package:closet/presentation/widgets/elevated_button_type_one.dart';
import 'package:closet/presentation/widgets/text_form_field_type_one.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthorizationView extends StatelessWidget {
  const AuthorizationView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthorizationModel>();
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
              const SizedBox(height: 150),
              Text(
                S.of(context).welcome,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),
              Text(
                S.of(context).sign_in_to_continue,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 30),
              Form(
                key: model.signInFormState,
                child: Column(
                  children: [
                    TextFormFieldTypeOne(
                      controller: model.loginController,
                      textInputAction: TextInputAction.next,
                      onTextChanged: (val) => model.login = val,
                      validator: (val) => model.loginValidator(val, context),
                      hintText: S.of(context).login,
                    ),
                    const SizedBox(height: 30),
                    TextFormFieldTypeOne(
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      onTextChanged: (val) => model.password = val,
                      validator: (val) => model.passwordValidator(val, context),
                      hintText: S.of(context).password,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButtonTypeOne(
                  onPressed: () => model.signIn(),
                  title: S.of(context).sign_in,
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButtonTypeOne(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(getIt.get<Registration>().route),
                  title: S.of(context).create,
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Column(
                  children: [
                    Text(S.of(context).or_sign_up_with,
                        style: Theme.of(context).textTheme.headline3),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset(
                          "assets/icons/gosuslugi.png",
                          width: 36,
                          height: 36,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
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
