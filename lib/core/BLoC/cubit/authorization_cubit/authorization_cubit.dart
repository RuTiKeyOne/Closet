import 'package:bloc/bloc.dart';
import 'package:closet/core/domain/model/user.dart';
import 'package:closet/core/internal/db_di/db_controller.dart';
import 'package:closet/core/internal/locator.dart';
import 'package:closet/presentation/navigation/route.dart' as route;
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'authorization_state.dart';

class AuthorizationCubit extends Cubit<AuthorizationState> {
  final DbController controller;
  AuthorizationCubit(this.controller, AuthorizationState state) : super(state);

  void emitSyncAthorizationView() async {
    final List<User> users = await controller.getUsers();
    emit(AuthorizationView(users));
  }

  void emitAsyncAthorizationView() async {
    final List<User> users = await controller.getUsers();
    await Future(() => emit(AuthorizationView(users)));
  }

  void signIn(
      {required String login,
      required String password,
      required List<User> users,
      required BuildContext context}) {
    final User? user = users.firstWhere(
        (element) => element.login == login && element.password == password);
    if (user != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          getIt.get<route.Main>().route, (Route<dynamic> route) => false,
          arguments: user);
    }
  }
}
