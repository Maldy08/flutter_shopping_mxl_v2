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
        if (state.user.favoritesNegocios![i].toString() == id) {
          isFavorite = true;
        }
      }
    }

    return isFavorite;
  }

  Future<void> toogleFavorite(String email, String id) async {
    await _firebaseUserRepositoryImpl.toogleFavorite(email: email, id: id);
  }
}
