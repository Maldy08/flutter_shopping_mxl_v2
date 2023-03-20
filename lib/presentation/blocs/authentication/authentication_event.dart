part of 'authentication_bloc.dart';

class AuthenticationEvent {
  const AuthenticationEvent();
}

class GoogleSignInRequested extends AuthenticationEvent {}

// When the user signing out this event is called and the [AuthRepository] is called to sign out the user
class SignOutRequested extends AuthenticationEvent {}
