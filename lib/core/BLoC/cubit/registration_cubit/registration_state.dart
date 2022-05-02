part of 'registration_cubit.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class RegistrationView extends RegistrationState {
  final List<User> users;
  @override
  List<Object> get props => [users];

  const RegistrationView(this.users);
}
