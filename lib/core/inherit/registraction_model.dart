import 'package:closet/core/domain/model/user.dart';
import 'package:closet/core/internal/db_di/db_controller.dart';
import 'package:closet/core/internal/locator.dart';
import 'package:closet/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

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
        registrationFormState.currentState!.validate(),
      };

  TextEditingController loginController;

  String _password;
  String get password => _login;
  set password(String val) => {
        _password = val,
        passwordController.text = _login,
        passwordController.selection = TextSelection.fromPosition(
            TextPosition(offset: loginController.text.length)),
        registrationFormState.currentState!.validate(),
      };

  TextEditingController passwordController;

  RegistrationModel(this._login, this.loginController, this._password,
      this.passwordController, this.registrationFormState);

  String? loginValidator(String? val, BuildContext context) {
    if (val == null || val.isEmpty) {
      return S.of(context).login_validator_message_1;
    }
    return null;
  }

  String? passwordValidator(String? val, BuildContext context) {
    if (val == null || val.isEmpty) {
      return S.of(context).password_validator_message_1;
    }
    return null;
  }

  void createAccount(BuildContext context) async {
    if (registrationFormState.currentState!.validate()) {
      final User user = User(login: _login, password: password);
      await getIt.get<DbController>().add(user);
      Navigator.pop(context);
    }
  }
}
