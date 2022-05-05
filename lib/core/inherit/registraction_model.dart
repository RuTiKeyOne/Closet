import 'package:closet/core/BLoC/cubit/authorization_cubit/authorization_cubit.dart';
import 'package:closet/core/BLoC/cubit/registration_cubit/registration_cubit.dart';
import 'package:closet/core/domain/model/user.dart';
import 'package:closet/core/internal/db_di/db_controller.dart';
import 'package:closet/core/internal/locator.dart';
import 'package:closet/generated/l10n.dart';
import 'package:closet/presentation/navigation/route.dart' as navigation;
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationModel extends ChangeNotifier {
  final GlobalKey<FormState> registrationFormState;

  String _login;
  String get login => _login;
  set login(String val) => {
        _login = val,
        loginController.text = _login,
        loginController.selection = TextSelection.fromPosition(
          TextPosition(offset: loginController.text.length),
        ),
      };

  TextEditingController loginController;

  String _password;
  String get password => _password;
  set password(String val) => {
        _password = val,
        passwordController.text = _password,
        passwordController.selection = TextSelection.fromPosition(
            TextPosition(offset: passwordController.text.length)),
      };

  TextEditingController passwordController;

  RegistrationModel(this._login, this.loginController, this._password,
      this.passwordController, this.registrationFormState);

  String? loginValidator(
      {required String? val,
      required BuildContext context,
      required List<User> users}) {
    if (val == null || val.isEmpty) {
      return S.of(context).login_validator_message_1;
    }

    if (users.any((element) => element.login == _login)) {
      return S.of(context).login_validator_message_3;
    }

    return null;
  }

  String? passwordValidator(String? val, BuildContext context) {
    if (val == null || val.isEmpty) {
      return S.of(context).password_validator_message_1;
    }
    return null;
  }

  void backOnPressed(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        getIt.get<navigation.Authorization>().route,
        (Route<dynamic> route) => false);
  }

  void createAccount(BuildContext context, List<User> users) async {
    if (registrationFormState.currentState!.validate()) {
      BlocProvider.of<RegistrationCubit>(context).createAccount(
          login: login, password: password, users: users, context: context);
    }
  }
}
