part of 'favorites_bloc.dart';

class FavoritesEvent {
  const FavoritesEvent();
}

class LoadFavorites extends FavoritesEvent {
  final User user;
  const LoadFavorites(this.user);
}

// class ToogleFavorites extends FavoritesEvent {
//   final String id;
//   const ToogleFavorites(this.id);
// }

// class IsFavorite extends FavoritesEvent {
//   final String id;
//   const IsFavorite(this.id);
// }
