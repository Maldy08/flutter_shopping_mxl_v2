import '../../infrastructure/models/models.dart';

abstract class UserRepository {
  Future<bool> isUserExists({required String email});
  Future<User?> getCurrentAppUser({required String email});
  Future<void> toogleFavorite({required User user});
  Future<void> saveToken({required String email, required String token});
}
