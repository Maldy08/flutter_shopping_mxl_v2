import 'dart:async';

import '/domain/repositories/auth_repository.dart';
import '../infrastructure.dart';

//import 'package:flutter_shopping_mxl_v2/infrastructure/models/user.dart';

class FirebaseAuthRepositoryImpl extends AuthRepository {
  final FirebaseAuthDatasource datasource;

  FirebaseAuthRepositoryImpl({FirebaseAuthDatasource? datasource})
      : datasource = datasource ?? FirebaseAuthDatasource();

  @override
  Future<void> signIn(String email, String password) {
    return datasource.signIn(email: email, password: password);
  }

  @override
  Future<void> singOut() {
    return datasource.singOut();
  }

  Future<void> signInWithGoogle() {
    return datasource.signInWithGoogle();
  }

  Future<void> singInWithApple() {
    return datasource.singInWithApple();
  }

  Stream<FirebaseUser> get user {
    return datasource.user;
  }

  @override
  Future<void> registerUser(
      {required String username,
      required String email,
      required String password}) {
    return datasource.registerUser(
      username: username,
      email: email,
      password: password,
    );
  }

  @override
  Future<void> onUserChange() {
    return datasource.onUserChange();
  }

  @override
  Future<void> deleteUser() {
    return datasource.deleteUser();
  }

  // @override
  // Future<User?> getCurrentAppUser({required String email}) {
  //   return datasource.getCurrentAppUser(email: email);
  // }

  // @override
  // Future<bool> isUserExists({required String email}) {
  //   return datasource.isUserExists(email: email);
  // }
}
