part of 'user_bloc.dart';

class UserEvent {
  const UserEvent();
}

class UserLogged extends UserEvent {
  final String email;
  const UserLogged(this.email);
}

class ToogleFavorites extends UserEvent {
  //final User user;
  final String id;
  const ToogleFavorites(this.id);
}

class ToogleFavoritesProducts extends UserEvent {
  final String uid;
  const ToogleFavoritesProducts(this.uid);
}

class IsFavorite extends UserEvent {
  final String id;
  const IsFavorite(this.id);
}

class IsFavoriteProduct extends UserEvent {
  final String uid;
  const IsFavoriteProduct(this.uid);
}

class SaveUserInfo extends UserEvent {
  final User user;
  SaveUserInfo(this.user);
}

class LoadUserFavoritesProducts extends UserEvent {
  final User user;
  LoadUserFavoritesProducts(this.user);
}

class SaveToken extends UserEvent {
  final String token;
  final String email;
  const SaveToken(this.email, this.token);
}
