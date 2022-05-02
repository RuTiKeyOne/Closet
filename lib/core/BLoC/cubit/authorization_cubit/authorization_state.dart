part of 'authorization_cubit.dart';

abstract class AuthorizationState extends Equatable {
  const AuthorizationState();

  @override
  List<Object> get props => [];
}

class AuthorizationInitial extends AuthorizationState {}

class AuthorizationView extends AuthorizationState {
  final List<User> users;
  @override
  List<Object> get props => [users];

  const AuthorizationView(this.users);
}
