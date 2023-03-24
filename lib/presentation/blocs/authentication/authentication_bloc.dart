import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/firebase/firebase_user.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/repositories/firebase_auth_repository_impl.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>
    with ChangeNotifier {
  AuthenticationBloc({FirebaseAuthRepositoryImpl? authenticationRepository})
      : _authenticationRepository =
            authenticationRepository ?? FirebaseAuthRepositoryImpl(),
        super(
          authenticationRepository!.datasource.currentUser.isEmpty
              ? AuthenticationState.authenticated(
                  authenticationRepository.datasource.currentUser)
              : const AuthenticationState.notauthenticated(),
        ) {
    on<_UserChanged>(_onUserChanged);
    on<LogoutRequested>(_onLogoutRequested);
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
  }

  void _onLogoutRequested(
      LogoutRequested event, Emitter<AuthenticationState> emit) {
    unawaited(_authenticationRepository.singOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
