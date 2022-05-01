import 'package:closet/core/inherit/registraction_model.dart';
import 'package:closet/generated/l10n.dart';
import 'package:closet/presentation/widgets/elevated_button_type_one.dart';
import 'package:closet/presentation/widgets/text_form_field_type_one.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<RegistrationModel>();
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    S.of(context).sign_up,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    S.of(context).create_an_account,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Form(
                key: model.registrationFormState,
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
                  onPressed: () => model.createAccount(context),
                  title: S.of(context).create,
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButtonTypeOne(
                  onPressed: () => Navigator.pop(context),
                  title: S.of(context).back,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
