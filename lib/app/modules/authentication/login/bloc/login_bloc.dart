import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../data/models/models.dart';
import '../../../../data/repositories/authentication_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.authenticationRepository) : super(LoginInitial()) {
    on<LoginInWithUsernameButtonPressed>(onLoginInWithUsernameButtonPressed);
  }
  final AuthenticationRepository authenticationRepository;

  Future<void> onLoginInWithUsernameButtonPressed(
      LoginInWithUsernameButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final result =
        await authenticationRepository.login(event.user, event.password);
    result.fold(
      (e) {
        emit(LoginFailure(error: e.message));
      },
      (response) async {
        final String accessToken = response.body['accessToken'];
        final String refreshToken = response.body['refreshToken'];
        final User user = User.fromJson(response.body);
        emit(LoginSuccess(
          user: user,
          accessToken: accessToken,
          refreshToken: refreshToken,
        ));
      },
    );
  }
}
