//import 'package:flutter_shopping_mxl_v2/infrastructure/models/models.dart';

abstract class AuthRepository {
  Future<void> signIn(String email, String password);
  Future<void> singOut();
  Future<void> registerUser({
    required String username,
    required String email,
    required String password,
  });
  Future<void> onUserChange();
  Future<void> deleteUser();
  // Future<bool> isUserExists({required String email});
  // Future<User?> getCurrentAppUser({required String email});
}
