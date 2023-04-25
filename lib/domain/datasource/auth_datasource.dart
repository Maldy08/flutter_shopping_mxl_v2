//import 'package:flutter_shopping_mxl_v2/infrastructure/models/models.dart';

abstract class AuthDatasoruce {
  Future<void> signIn({required String email, required String password});
  Future<void> singOut();
  Future<void> registerUser({
    required String username,
    required String email,
    required String password,
  });

  Future<void> onUserChange();
  // Future<bool> isUserExists({required String email});
  // Future<User?> getCurrentAppUser({required String email});
}
