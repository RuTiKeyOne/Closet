import 'package:closet/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class AuthorizationModel extends ChangeNotifier {
  final GlobalKey<FormState> signInFormState;

  String _login;
  String get login => _login;
  set login(String val) => {
        _login = val,
        loginController.text = _login,
        loginController.selection = TextSelection.fromPosition(
          TextPosition(offset: loginController.text.length),
        ),
        signInFormState.currentState!.validate(),
      };

  TextEditingController loginController;

  String _password;
  String get password => _login;
  set password(String val) => {
        _password = val,
        passwordController.text = _login,
        passwordController.selection = TextSelection.fromPosition(
            TextPosition(offset: loginController.text.length)),
        signInFormState.currentState!.validate(),
      };

  TextEditingController passwordController;

  AuthorizationModel(this._login, this.loginController, this._password,
      this.passwordController, this.signInFormState);

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

  void signIn() {
    if (signInFormState.currentState!.validate()) {}
  }
}
