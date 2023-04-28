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
    on<UserToogleFavorites>(_toogleFavorite);
  }

  Future<void> _userLogged(UserLogged event, Emitter<UserState> emit) async {
    // return await Future.delayed(const Duration(milliseconds: 200));
    // if (state.user.isNotEmpty) return;
    emit(state.copyWith(status: UserStatus.fetching));
    final user =
        await _firebaseUserRepositoryImpl.getCurrentAppUser(email: event.email);
    emit(state.copyWith(
      status: UserStatus.completed,
      user: user,
    ));
  }

  bool isFavoriteNegocio(String id) {
    bool isFavorite = false;
    if (state.user.favoritesNegocios != null) {
      for (var i = 0; i < state.user.favoritesNegocios!.length; i++) {
        if (state.user.favoritesNegocios![i].idnegocio.toString() == id) {
          isFavorite = true;
        }
      }
    }

    return isFavorite;
  }

  Future<void> _toogleFavorite(
      UserToogleFavorites event, Emitter<UserState> emit) async {
    final user = state.user;
    if (user.favoritesNegocios != null) {
      final favorite = user.favoritesNegocios!
          .where((element) => element.idnegocio.toString() == event.id)
          .first;
      state.user.favoritesNegocios!.remove(favorite);
      // emit(state.copyWith(user: user));
      // for (var i = 0; i < user.favoritesNegocios!.length; i++) {
      //   if (user.favoritesNegocios![i].idnegocio.toString() == id) {
      //     user.favoritesNegocios!.remove(id);
      //   }
      // }

      emit(state.copyWith(user: user));
    }
    await _firebaseUserRepositoryImpl.toogleFavorite(
        email: state.user.email, id: event.id, user: state.user);
  }
}
