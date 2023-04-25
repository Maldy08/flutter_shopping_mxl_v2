import '../../infrastructure/models/models.dart';

abstract class UserDataSource {
  Future<bool> isUserExists({required String email});
  Future<User?> getCurrentAppUser({required String email});
}
