import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '/infrastructure/infrastructure.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>
    with ChangeNotifier {
  AuthenticationBloc({FirebaseAuthRepositoryImpl? authenticationRepository})
      : _authenticationRepository =
            authenticationRepository ?? FirebaseAuthRepositoryImpl(),
        super(
          authenticationRepository!.datasource.currentUser.isNotEmpty
              ? AuthenticationState.authenticated(
                  authenticationRepository.datasource.currentUser,
                )
              : const AuthenticationState.notauthenticated(),
        ) {
    on<_UserChanged>(_onUserChanged);
    on<LogoutRequested>(_onLogoutRequested);
    on<DeleteAcount>(_onDeleteAcountRequested);

    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(_UserChanged(user)),
    );
  }

  final FirebaseAuthRepositoryImpl _authenticationRepository;
  late final StreamSubscription<FirebaseUser> _userSubscription;

  void _onUserChanged(_UserChanged event, Emitter<AuthenticationState> emit) {
    emit(
      event.user.isNotEmpty
          ? AuthenticationState.authenticated(event.user)
          : const AuthenticationState.notauthenticated(),
    );
    notifyListeners();
  }

  void _onLogoutRequested(
      LogoutRequested event, Emitter<AuthenticationState> emit) {
    unawaited(_authenticationRepository.singOut());
    // close();
    notifyListeners();
  }

  void onUserChange() {
    _authenticationRepository.onUserChange();
  }

  void _onDeleteAcountRequested(
      DeleteAcount event, Emitter<AuthenticationState> emit) {
    unawaited(_authenticationRepository.deleteUser());
    notifyListeners();
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
