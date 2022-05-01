import 'package:closet/core/domain/model/user.dart';
import 'package:closet/core/internal/db_di/db_controller.dart';
import 'package:closet/core/internal/locator.dart';
import 'package:closet/generated/l10n.dart';
import 'package:closet/presentation/navigation/route.dart';
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

  void signIn(BuildContext context) async {
    if (signInFormState.currentState!.validate()) {
      final users = await getIt.get<DbController>().getUsers();
      final User? user = users.firstWhere((element) =>
          element.login == _login && element.password == _password);
      if (user != null) {
        Navigator.of(context).pushNamed(getIt.get<Main>().route);
      }
    }
  }
}
