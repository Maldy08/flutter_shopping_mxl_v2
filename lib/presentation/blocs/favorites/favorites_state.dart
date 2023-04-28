part of 'favorites_bloc.dart';

class FavoritesState extends Equatable {
  final List<Favorites> favorites;

  const FavoritesState({
    this.favorites = const [],
  });

  FavoritesState copyWith({
    List<Favorites>? favorites,
  }) =>
      FavoritesState(
        favorites: favorites ?? this.favorites,
      );

  @override
  List<Object> get props => [favorites];
}
