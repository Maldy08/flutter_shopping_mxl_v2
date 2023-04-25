part of 'user_bloc.dart';

class UserEvent {
  const UserEvent();
}

class UserLogged extends UserEvent {
  final String email;
  const UserLogged(this.email);
}
