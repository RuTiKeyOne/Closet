import 'package:closet/core/BLoC/cubit/authorization_cubit/authorization_cubit.dart';
import 'package:closet/core/domain/model/user.dart';
import 'package:closet/core/internal/locator.dart';
import 'package:closet/generated/l10n.dart';
import 'package:closet/presentation/navigation/route.dart' as navigator;
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  AuthorizationModel(
    this._login,
    this.loginController,
    this._password,
    this.passwordController,
    this.signInFormState,
  );

  String? loginValidator(
      {required String? val,
      required BuildContext context,
      required List<User> users}) {
    if (val == null || val.isEmpty) {
      return S.of(context).login_validator_message_1;
    }

    if (!users.any((element) =>
        element.login == _login && element.password == _password)) {
      return S.of(context).login_or_password_is_incorrect;
    }

    return null;
  }

  String? passwordValidator(
      {required String? val,
      required BuildContext context,
      required List<User> users}) {
    if (val == null || val.isEmpty) {
      return S.of(context).password_validator_message_1;
    }

    if (!users.any((element) =>
        element.login == _login && element.password == _password)) {
      return S.of(context).login_or_password_is_incorrect;
    }

    return null;
  }

  void createAccountOnPressed(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        getIt.get<navigator.Registration>().route,
        (Route<dynamic> route) => false);
  }

  void signIn(BuildContext context, List<User> users) async {
    if (signInFormState.currentState!.validate()) {
      BlocProvider.of<AuthorizationCubit>(context).signIn(
          login: login, password: password, users: users, context: context);
    }
  }
}
