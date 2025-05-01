part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStarted extends AuthenticationEvent {}

class AuthenticationUserChanged extends AuthenticationEvent {
  final User user;
  final String accessToken;
  final String refreshToken;

  const AuthenticationUserChanged({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  List<Object> get props => [user, accessToken, refreshToken];
}

class AuthenticationLogOutRequested extends AuthenticationEvent {}
