import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/models.dart';
import 'package:flutter_shopping_mxl_v2/presentation/models/models.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(const FavoritesState()) {
    on<LoadFavorites>(_loadFavorites);
    // on<ToogleFavorites>(_toogleFavorite);
    // on<IsFavorite>(_isFavorite);
  }

  void _loadFavorites(LoadFavorites event, Emitter<FavoritesState> emit) {
    List<Favorites> favorites = [];
    // favorites.add(Favorites(idnegocio: "1", isFavorite: false));
    if (event.user.favoritesNegocios == null) return;

    event.user.favoritesNegocios!.forEach((element) => favorites.add(
        Favorites(idnegocio: element.idnegocio.toString(), isFavorite: true)));

    emit(state.copyWith(
      favorites: favorites,
    ));
    // return Future.delayed(const Duration(milliseconds: 100));
  }

  // bool isFavorite(String id) {
  //   bool isFavorite = false;
  //   final negocio = state.favorites.where((element) => element.idnegocio == id);
  //   negocio.isNotEmpty ? isFavorite = true : isFavorite = false;
  //   //emit(state.copyWith(isFavorite: isFavorite));
  //   add(IsFavorite(id));
  //   return isFavorite;
  // }

  // void _isFavorite(IsFavorite event, Emitter<FavoritesState> emit) {
  //   final negocio =
  //       state.favorites.where((element) => element.idnegocio == event.id);
  //   negocio.isNotEmpty
  //       ? emit(state.copyWith(isFavorite: true))
  //       : emit(state.copyWith(isFavorite: false));
  // }

  // void _toogleFavorite(ToogleFavorites event, Emitter<FavoritesState> emit) {
  //   final result =
  //       state.favorites.where((element) => element.idnegocio == event.id);

  //   final negocio = result.isNotEmpty ? result.first : null;
  //   negocio == null
  //       ? state.favorites.add(Favorites(idnegocio: event.id, isFavorite: true))
  //       : state.favorites.remove(negocio);

  //   final favorites = state.favorites;
  //   emit(state.copyWith(favorites: favorites));
  //   add(IsFavorite(event.id));
  // }
}
