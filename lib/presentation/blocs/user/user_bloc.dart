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
    on<IsFavorite>(_isFavorite);
  }

  Future<void> _userLogged(UserLogged event, Emitter<UserState> emit) async {
    // return await Future.delayed(const Duration(milliseconds: 200));
    // if (state.user.isNotEmpty) return;
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

  // bool isFavoriteNegocio(String id) {
  //   bool isFavorite = false;
  //   if (state.user.favoritesNegocios != null) {
  //     for (var i = 0; i < state.user.favoritesNegocios!.length; i++) {
  //       if (state.user.favoritesNegocios![i].idnegocio.toString() == id) {
  //         isFavorite = true;
  //       }
  //     }
  //   }

  //   return isFavorite;
  // }

  bool isFavorite(String id) {
    bool isFavorite = false;
    final negocio = state.user.favoritesNegocios!
        .where((element) => element.idnegocio.toString() == id);
    negocio.isNotEmpty ? isFavorite = true : isFavorite = false;
    add(IsFavorite(id));
    return isFavorite;
  }

  void _isFavorite(IsFavorite event, Emitter<UserState> emit) {
    final negocio = state.user.favoritesNegocios!
        .where((element) => element.idnegocio.toString() == event.id);
    negocio.isNotEmpty
        ? emit(state.copyWith(isFavorite: true))
        : emit(state.copyWith(isFavorite: false));
  }

  void _toogleFavorite(ToogleFavorites event, Emitter<UserState> emit) async {
    final result = state.user.favoritesNegocios!
        .where((element) => element.idnegocio.toString() == event.id);

    final negocio = result.isNotEmpty ? result.first : null;
    negocio == null
        ? state.user.favoritesNegocios!
            .add(FavoritesNegocio(idnegocio: int.parse(event.id)))
        : state.user.favoritesNegocios!.remove(negocio);

    //final favorites = state.user.favoritesNegocios!;
    //favorites.map((e) => state.user.favoritesNegocios!.add(e));
    final user = state.user;
    await _firebaseUserRepositoryImpl.toogleFavorite(user: user).then(
      (_) {
        emit(state.copyWith(user: user));
        add(IsFavorite(event.id));
      },
    );
  }
  // Future<void> _toogleFavorite(
  //     UserToogleFavorites event, Emitter<UserState> emit) async {
  //   final user = state.user;
  //   if (user.favoritesNegocios != null) {
  //     final favorite = user.favoritesNegocios!
  //         .where((element) => element.idnegocio.toString() == event.id)
  //         .first;
  //     state.user.favoritesNegocios!.remove(favorite);
  //     // emit(state.copyWith(user: user));
  //     // for (var i = 0; i < user.favoritesNegocios!.length; i++) {
  //     //   if (user.favoritesNegocios![i].idnegocio.toString() == id) {
  //     //     user.favoritesNegocios!.remove(id);
  //     //   }
  //     // }

  //     emit(state.copyWith(user: user));
  //   }
  //   await _firebaseUserRepositoryImpl.toogleFavorite(
  //       email: state.user.email, id: event.id, user: state.user);
  // }
}
