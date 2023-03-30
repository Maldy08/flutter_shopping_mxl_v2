//import 'package:flutter_shopping_mxl_v2/infrastructure/models/models.dart';

abstract class AuthRepository {
  Future<void> signIn(String email, String password);
  Future<void> singOut();
  Future<void> registerUser({
    required String username,
    required String email,
    required String password,
  });
}
