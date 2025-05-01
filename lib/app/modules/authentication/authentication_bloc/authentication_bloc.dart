import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:luttrell/app/data/repositories/authentication_repository.dart';
import '../../../data/models/models.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this.authenticationRepository)
      : super(AuthenticationInitial()) {
    on<AuthenticationStarted>(onAuthenticationStarted);
    on<AuthenticationUserChanged>(onAuthenticationUserChanged);
    on<AuthenticationLogOutRequested>(onAuthenticationLogOutRequested);
  }
  final AuthenticationRepository authenticationRepository;

  Future<void> onAuthenticationStarted(
    AuthenticationStarted event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    final User? currentUser = await authenticationRepository.getUser();
    if (currentUser != null) {
      emit(AuthenticationAuthenticated());
    } else {
      emit(AuthenticationNotAuthenticated());
    }
  }

  Future<void> onAuthenticationUserChanged(
    AuthenticationUserChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    await authenticationRepository.saveAccessToken(event.accessToken);
    await authenticationRepository.saveRefreshToken(event.refreshToken);
    await authenticationRepository.saveUser(event.user);
    emit(AuthenticationAuthenticated());

    return;
  }

  Future<void> onAuthenticationLogOutRequested(
    AuthenticationLogOutRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    await authenticationRepository.logout();
    emit(AuthenticationNotAuthenticated());
  }
}
