import 'package:bloc/bloc.dart';
import 'package:closet/core/domain/model/user.dart';
import 'package:closet/core/internal/db_di/db_controller.dart';
import 'package:equatable/equatable.dart';

part 'edit_state.dart';

class EditCubit extends Cubit<EditState> {
  final DbController controller;
  EditCubit({required this.controller, required EditState initialState})
      : super(initialState);

  void emitEditView() async {
    final users = await controller.getUsers();
    await Future(() => emit(EditView(users)));
  }
}
