import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_shopping_mxl_v2/domain/datasource/auth_datasource.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/firebase/firebase_user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthDatasource extends AuthDatasoruce {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthDatasource(FirebaseAuth? firebaseAuth)
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> singOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }
}
