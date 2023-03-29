import 'dart:async';

import 'package:flutter_shopping_mxl_v2/domain/repositories/auth_repository.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/datasources/firebase_auth_datasource.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/firebase/firebase_user.dart';
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

  Stream<FirebaseUser> get user {
    return datasource.user;
  }

  @override
  Future<void> registerUser({required String email, required String password}) {
    return datasource.registerUser(email: email, password: password);
  }
}
