import 'package:closet/core/BLoC/cubit/authorization_cubit/authorization_cubit.dart';
import 'package:closet/core/domain/model/user.dart';
import 'package:closet/core/internal/db_di/db_controller.dart';
import 'package:closet/core/internal/locator.dart';
import 'package:closet/generated/l10n.dart';
import 'package:closet/presentation/navigation/route.dart' as navigation;
import 'package:flutter/cupertino.dart';

class EditProfileModel extends ChangeNotifier {
  final GlobalKey<FormState> formKey;
  final AuthorizationCubit authorizationCubit;
  final DbController dbController;
  final User user;
  late TextEditingController loginController;
  late TextEditingController passwordController;
  late TextEditingController emailController;
  late TextEditingController telephoneController;
  late String loginValue;
  late String passwordValue;
  late String emailValue;
  late String telephoneValue;

  EditProfileModel({
    required this.authorizationCubit,
    required this.dbController,
    required this.user,
    required this.formKey,
  }) {
    loginController = TextEditingController(text: user.login);
    loginController.selection = TextSelection.fromPosition(
        TextPosition(offset: loginController.text.length));
    passwordController = TextEditingController(text: user.password);
    passwordController.selection = TextSelection.fromPosition(
        TextPosition(offset: passwordController.text.length));
    emailController = TextEditingController(text: user.email);
    emailController.selection = TextSelection.fromPosition(
        TextPosition(offset: emailController.text.length));
    telephoneController = TextEditingController(text: user.telephone);
    telephoneController.selection = TextSelection.fromPosition(
        TextPosition(offset: telephoneController.text.length));
    loginValue = user.login;
    passwordValue = user.password;
    emailValue = user.email ?? "";
    telephoneValue = user.telephone ?? "";
  }

  String? loginValidator({
    required String? val,
    required BuildContext context,
    required List<User> users,
    required User user,
  }) {
    final updatedUsers = users..removeWhere((element) => element.id == user.id);

    if (val == null || val.isEmpty) {
      return S.of(context).login_validator_message_1;
    }

    if (updatedUsers.any((element) => element.login == loginValue)) {
      return S.of(context).login_validator_message_3;
    }

    return null;
  }

  String? passwordValidator({
    required String? val,
    required BuildContext context,
  }) {
    if (val == null || val.isEmpty) {
      return S.of(context).password_validator_message_1;
    }

    return null;
  }

  String? emailValidator({
    required String? val,
    required BuildContext context,
  }) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailValue);
    if (emailValue.isNotEmpty) {
      if (!emailValid) {
        return S.of(context).email_validator_message_2;
      }
    }
    return null;
  }

  String? telephoneValidator({
    required String? val,
    required BuildContext context,
  }) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);

    if (telephoneValue.isNotEmpty) {
      if (!regExp.hasMatch(telephoneValue)) {
        return S.of(context).telephone_validator_message_2;
      }
    }
    return null;
  }

  void save(User user, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      User updatedUser = user.copyWith(
          login: loginValue,
          password: passwordValue,
          email: emailValue,
          telephone: telephoneValue);
      await dbController.update(updatedUser);
      authorizationCubit.emitAsyncAthorizationView();
      Navigator.of(context).pushNamedAndRemoveUntil(
          getIt.get<navigation.Profile>().route,
          (Route<dynamic> route) => false,
          arguments: updatedUser);
    }
  }
}
