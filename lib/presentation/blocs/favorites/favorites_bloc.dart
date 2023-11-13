import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '/infrastructure/models/models.dart';
import '/presentation/models/models.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(const FavoritesState()) {
    on<LoadFavorites>(_loadFavorites);
  }

  void _loadFavorites(LoadFavorites event, Emitter<FavoritesState> emit) {
    List<Favorites> favorites = [];
    // favorites.add(Favorites(idnegocio: "1", isFavorite: false));
    if (event.user.favoritesNegocios.isEmpty) return;

    event.user.favoritesNegocios.forEach((element) => favorites.add(
        Favorites(idnegocio: element.idnegocio.toString(), isFavorite: true)));

    emit(state.copyWith(
      favorites: favorites,
    ));
    // return Future.delayed(const Duration(milliseconds: 100));
  }
}
