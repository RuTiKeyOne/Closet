import 'package:bloc/bloc.dart';
import 'package:closet/core/BLoC/cubit/authorization_cubit/authorization_cubit.dart';
import 'package:closet/core/BLoC/cubit/edit_cubit/edit_cubit.dart';
import 'package:closet/core/domain/model/user.dart';
import 'package:closet/core/internal/db_di/db_controller.dart';
import 'package:closet/core/internal/locator.dart';
import 'package:closet/presentation/navigation/route.dart' as navigation;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final DbController controller;
  final EditCubit editCubit;
  final AuthorizationCubit authorizationCubit;

  RegistrationCubit(
      {required this.authorizationCubit,
      required this.controller,
      required this.editCubit,
      required RegistrationState initialState})
      : super(initialState);

  void emitSyncRegistrationView() async {
    final List<User> users = await controller.getUsers();
    emit(RegistrationView(users));
  }

  void emitAsyncRegistrationView() async {
    final List<User> users = await controller.getUsers();
    await Future(() => emit(RegistrationView(users)));
  }

  void createAccount(
      {required String login,
      required String password,
      required List<User> users,
      required BuildContext context}) async {
    final User user = User(login: login, password: password, orders: []);
    await controller.add(user);
    authorizationCubit.emitAsyncAthorizationView();
    Navigator.of(context).pushNamedAndRemoveUntil(
        getIt.get<navigation.Authorization>().route,
        (Route<dynamic> route) => false);
    editCubit.emitEditView();
  }
}
