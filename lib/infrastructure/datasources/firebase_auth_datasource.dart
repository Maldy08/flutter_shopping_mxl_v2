import 'package:cache/cache.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_shopping_mxl_v2/domain/datasource/auth_datasource.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/models.dart'
    as models;

import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthDatasource extends AuthDatasoruce {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final GoogleSignIn _googleSignIn;
  final CacheClient _cache;

  FirebaseAuthDatasource(
      {CacheClient? cache,
      FirebaseAuth? firebaseAuth,
      GoogleSignIn? googleSignIn,
      FirebaseFirestore? firebaseFirestore})
      : _cache = cache ?? CacheClient(),
        _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

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
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

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
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (e) {
      throw Exception(e);
    }
  }

  static const userCacheKey = '__user_cache_key__';

  models.FirebaseUser get currentUser {
    return _cache.read<models.FirebaseUser>(key: userCacheKey) ??
        models.FirebaseUser.empty;
  }

  Stream<models.FirebaseUser> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null
          ? models.FirebaseUser.empty
          : models.FirebaseUser(
              id: firebaseUser.uid,
              email: firebaseUser.email,
              name: firebaseUser.displayName,
              photoUrl: firebaseUser.photoURL,
            );
      _cache.write(key: userCacheKey, value: user);
      return user;
    });
  }

  @override
  Future<void> registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      //  .whenComplete(() {
      //_firebaseAuth.currentUser!.updateDisplayName(username);
      //_firebaseAuth.currentUser!.updatePhotoURL(
      //  'https://t3.ftcdn.net/jpg/03/58/90/78/360_F_358907879_Vdu96gF4XVhjCZxN2kCG0THTsSQi8IhT.jpg');
      //   });

      await _firebaseAuth.currentUser!.updateDisplayName(username);

      // await _firebaseAuth.currentUser!.updatePhotoURL(
      // 'https://t3.ftcdn.net/jpg/03/58/90/78/360_F_358907879_Vdu96gF4XVhjCZxN2kCG0THTsSQi8IhT.jpg');

      //await _firebaseFirestore.collection('users');
      await _firebaseFirestore.collection('users').doc().set({
        'uid': credentials.user!.uid,
        'username': username,
        'email': credentials.user!.email,
        'age': 0,
        'sex': '',
        'phoneNumber': '',
        'photoUrl':
            'https://t3.ftcdn.net/jpg/03/58/90/78/360_F_358907879_Vdu96gF4XVhjCZxN2kCG0THTsSQi8IhT.jpg'
      });

      // collectionUsers.add({
      //   'uid': credentials.user!.uid,
      //   'username': username,
      //   'email': credentials.user!.email,
      //   'age': 0,
      //   'sex': '',
      //   'phoneNumber': '',
      //   'photoUrl':
      //       'https://t3.ftcdn.net/jpg/03/58/90/78/360_F_358907879_Vdu96gF4XVhjCZxN2kCG0THTsSQi8IhT.jpg'
      // });

      // .then((_) =>
      //     _firebaseAuth.currentUser!.updateDisplayName("Carlos Maldonado"));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception('Esta email ya se encuentra en uso!');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    //final user = Models.User(uid: result.user!.uid);
  }

  @override
  Future<void> onUserChange() async {
    _firebaseAuth.currentUser?.reload();
  }
}
