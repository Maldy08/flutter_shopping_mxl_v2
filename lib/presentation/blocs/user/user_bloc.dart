import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/models.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/repositories/firebase_user_repository_impl.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FirebaseUserRepositoryImpl _firebaseUserRepositoryImpl;

  UserBloc({FirebaseUserRepositoryImpl? firebaseUserRepositoryImpl})
      : _firebaseUserRepositoryImpl =
            firebaseUserRepositoryImpl ?? FirebaseUserRepositoryImpl(),
        super(const UserState()) {
    on<UserLogged>(_userLogged);
    on<ToogleFavorites>(_toogleFavorite);
    on<ToogleFavoritesProducts>(_toogleFavoriteProduct);
    on<IsFavorite>(_isFavorite);
    on<IsFavoriteProduct>(_isFavoriteProduct);
  }

  Future<void> _userLogged(UserLogged event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserStatus.fetching));
    await _firebaseUserRepositoryImpl
        .getCurrentAppUser(email: event.email)
        .then((value) {
      emit(state.copyWith(
        status: UserStatus.completed,
        user: value,
      ));
    });
  }

  bool isFavorite(String id) {
    bool isFavorite = false;
    final negocio = state.user.favoritesNegocios
        .where((element) => element.idnegocio.toString() == id);
    negocio.isNotEmpty ? isFavorite = true : isFavorite = false;
    add(IsFavorite(id));
    return isFavorite;
  }

  bool isFavoriteProduct(String uid) {
    bool isFavorite = false;
    final product = state.user.favoritesProducts
        .where((element) => element.idproducto == uid);
    product.isNotEmpty ? isFavorite = true : false;
    add(IsFavoriteProduct(uid));
    return isFavorite;
  }

  void _isFavorite(IsFavorite event, Emitter<UserState> emit) {
    final negocio = state.user.favoritesNegocios
        .where((element) => element.idnegocio.toString() == event.id);
    negocio.isNotEmpty
        ? emit(state.copyWith(isFavorite: true))
        : emit(state.copyWith(isFavorite: false));
  }

  void _isFavoriteProduct(IsFavoriteProduct event, Emitter<UserState> emit) {
    final product = state.user.favoritesProducts
        .where((element) => element.idproducto == event.uid);
    product.isNotEmpty
        ? emit(state.copyWith(isFavoriteProduct: true))
        : emit(state.copyWith(isFavoriteProduct: false));
  }

  void _toogleFavorite(ToogleFavorites event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserStatus.fetching));

    final result = state.user.favoritesNegocios
        .where((element) => element.idnegocio.toString() == event.id);

    final negocio = result.isNotEmpty ? result.first : null;
    negocio == null
        ? state.user.favoritesNegocios
            .add(FavoritesNegocio(idnegocio: event.id))
        : state.user.favoritesNegocios.remove(negocio);

    final user = state.user;
    await _firebaseUserRepositoryImpl.toogleFavorite(user: user).then(
      (_) {
        emit(state.copyWith(status: UserStatus.completed, user: user));
        add(IsFavorite(event.id));
      },
    );
  }

  void _toogleFavoriteProduct(
      ToogleFavoritesProducts event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserStatus.fetching));

    final result = state.user.favoritesProducts
        .where((element) => element.idproducto == event.uid);

    final product = result.isNotEmpty ? result.first : null;
    product == null
        ? state.user.favoritesProducts
            .add(FavoritesProduct(idproducto: event.uid))
        : state.user.favoritesProducts.remove(product);

    final user = state.user;
    await _firebaseUserRepositoryImpl.toogleFavorite(user: user).then((_) {
      emit(state.copyWith(status: UserStatus.completed, user: user));
      add(IsFavoriteProduct(event.uid));
    });
  }
}
