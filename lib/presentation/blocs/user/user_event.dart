part of 'user_bloc.dart';

class UserEvent {
  const UserEvent();
}

class UserLogged extends UserEvent {
  final String email;
  const UserLogged(this.email);
}

class UserToogleFavorites extends UserEvent {
  final User user;
  final String id;
  const UserToogleFavorites(this.user, this.id);
}
