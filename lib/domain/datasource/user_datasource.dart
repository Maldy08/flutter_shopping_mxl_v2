import '../../infrastructure/models/models.dart';

abstract class UserDataSource {
  Future<bool> isUserExists({required String email});
  Future<User?> getCurrentAppUser({required String email});
  //Future<bool> isFavoriteNegocio({required int id});
  Future<void> toogleFavorite({required User user});
  Future<void> saveToken({required String email, required String token});
}
