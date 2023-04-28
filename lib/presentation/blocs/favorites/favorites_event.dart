part of 'favorites_bloc.dart';

class FavoritesEvent {
  const FavoritesEvent();
}

class LoadFavorites extends FavoritesEvent {
  final User user;

  const LoadFavorites(this.user);
}
