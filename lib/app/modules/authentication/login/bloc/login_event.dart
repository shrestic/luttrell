part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginInWithUsernameButtonPressed extends LoginEvent {
  final String user;
  final String password;

  const LoginInWithUsernameButtonPressed(
      {required this.user, required this.password});

  @override
  List<Object> get props => [user, password];
}
