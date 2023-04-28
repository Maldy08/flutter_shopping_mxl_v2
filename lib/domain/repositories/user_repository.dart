import '../../infrastructure/models/models.dart';

abstract class UserRepository {
  Future<bool> isUserExists({required String email});
  Future<User?> getCurrentAppUser({required String email});
  Future<void> toogleFavorite(
      {required String email, required String id, required User user});
}
