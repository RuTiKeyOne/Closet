part of 'edit_cubit.dart';

abstract class EditState extends Equatable {
  const EditState();

  @override
  List<Object> get props => [];
}

class EditInitial extends EditState {}

class EditView extends EditState {
  final List<User> users;

  @override
  List<Object> get props => [users];

  const EditView(this.users);
}
