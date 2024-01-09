part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class LogoutRequested extends AuthenticationEvent {
  const LogoutRequested();
}

class DeleteAcount extends AuthenticationEvent {
  const DeleteAcount();
}

class _UserChanged extends AuthenticationEvent {
  const _UserChanged(this.user);
  final FirebaseUser user;
}
