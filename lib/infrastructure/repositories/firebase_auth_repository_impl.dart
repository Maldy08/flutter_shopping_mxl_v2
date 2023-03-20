import 'package:flutter_shopping_mxl_v2/domain/repositories/auth_repository.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/datasources/firebase_auth_datasource.dart';

class FirebaseAuthRepositoryImpl extends AuthRepository {
  final FirebaseAuthDatasource datasoruce;

  FirebaseAuthRepositoryImpl(this.datasoruce);

  @override
  Future<void> signIn(String email, String password) {
    return datasoruce.signIn(email: email, password: password);
  }

  @override
  Future<void> singOut() {
    return datasoruce.singOut();
  }

  Future<void> signInWithGoogle() {
    return datasoruce.signInWithGoogle();
  }
}
