part of 'favorites_bloc.dart';

class FavoritesState extends Equatable {
  final List<Favorites> favorites;
  final bool isFavorite;

  const FavoritesState({
    this.favorites = const [],
    this.isFavorite = false,
  });

  FavoritesState copyWith({
    List<Favorites>? favorites,
    bool? isFavorite,
  }) =>
      FavoritesState(
        favorites: favorites ?? this.favorites,
        isFavorite: isFavorite ?? this.isFavorite,
      );

  @override
  List<Object> get props => [favorites, isFavorite];
}
