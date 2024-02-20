import 'dart:convert';
import 'dart:math';

import 'package:cache/cache.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../models/models.dart' as models;

import '/domain/datasource/auth_datasource.dart';

class FirebaseAuthDatasource extends AuthDatasoruce {
  final FirebaseAuth _firebaseAuth;
  final FirebaseAnalytics _firebaseAnalytics;
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseMessaging _firebaseMessaging;
  final GoogleSignIn _googleSignIn;
  final CacheClient _cache;

  FirebaseAuthDatasource(
      {CacheClient? cache,
      FirebaseAuth? firebaseAuth,
      FirebaseAnalytics? firebaseAnalytics,
      GoogleSignIn? googleSignIn,
      FirebaseFirestore? firebaseFirestore,
      FirebaseMessaging? firebaseMessaging})
      : _cache = cache ?? CacheClient(),
        _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firebaseAnalytics = firebaseAnalytics ?? FirebaseAnalytics.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard(),
        _firebaseMessaging = firebaseMessaging ?? FirebaseMessaging.instance;

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      await _firebaseAnalytics.logEvent(name: 'login', parameters: {
        'email': email,
        'password': password,
      });
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

  Future<bool> isUserExists({required String email}) async {
    bool exists = false;
    try {
      await _firebaseFirestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get()
          .then((value) => value.size > 0 ? exists = true : exists = false);
    } catch (e) {
      throw Exception(e.toString());
    }

    return exists;
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
      final exists =
          await isUserExists(email: _firebaseAuth.currentUser!.email!);

      if (exists) return;

      await _firebaseFirestore.collection('users').doc().set({
        'uid': _firebaseAuth.currentUser!.uid,
        'username': _firebaseAuth.currentUser!.displayName ?? 'no_display_name',
        'email': _firebaseAuth.currentUser!.email,
        'age': 0,
        'sex': '',
        'phoneNumber': '',
        'photoUrl': _firebaseAuth.currentUser!.photoURL ??
            'https://t3.ftcdn.net/jpg/03/58/90/78/360_F_358907879_Vdu96gF4XVhjCZxN2kCG0THTsSQi8IhT.jpg',
        'favorites_negocios': [],
        'favorites_products': [],
        'token': ''
      });
      await _firebaseAnalytics.logLogin(loginMethod: 'google', parameters: {
        'email': _firebaseAuth.currentUser!.email,
        'uid': _firebaseAuth.currentUser!.uid,
      });

      await _firebaseFirestore.collection('tokens').doc().set(
        {
          'uid': _firebaseAuth.currentUser!.uid,
          'email': _firebaseAuth.currentUser!.email,
          'token': '',
        },
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<void> singInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      // Create an `OAuthCredential` from the credential returned by Apple.
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      await _firebaseAuth.signInWithCredential(oauthCredential);

      final exists =
          await isUserExists(email: _firebaseAuth.currentUser!.email!);

      await _firebaseAnalytics.logLogin(loginMethod: 'apple', parameters: {
        'email': _firebaseAuth.currentUser!.email,
        'uid': _firebaseAuth.currentUser!.uid,
      });

      if (exists) return;

      await _firebaseAuth.currentUser!
          .updateDisplayName(appleCredential.givenName ?? 'appleid_user');
      await _firebaseAuth.currentUser!.updatePhotoURL(
          'https://t3.ftcdn.net/jpg/03/58/90/78/360_F_358907879_Vdu96gF4XVhjCZxN2kCG0THTsSQi8IhT.jpg');

      // _firebaseAuth.currentUser!.reload();

      await _firebaseFirestore.collection('users').doc().set({
        'uid': _firebaseAuth.currentUser!.uid,
        'username': _firebaseAuth.currentUser!.displayName ?? 'no_display_name',
        'email': _firebaseAuth.currentUser!.email,
        'age': 0,
        'sex': '',
        'phoneNumber': '',
        'photoUrl': _firebaseAuth.currentUser!.photoURL ??
            'https://t3.ftcdn.net/jpg/03/58/90/78/360_F_358907879_Vdu96gF4XVhjCZxN2kCG0THTsSQi8IhT.jpg',
        'favorites_negocios': [],
        'favorites_products': [],
        'token': ''
      });

      await _firebaseFirestore.collection('tokens').doc().set(
        {
          'uid': _firebaseAuth.currentUser!.uid,
          'email': _firebaseAuth.currentUser!.email,
          'token': '',
        },
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> singOut() async {
    bool exists = false;
    final token = await _firebaseMessaging.getToken();
    final email = _firebaseAuth.currentUser!.email ?? 'pruebas@google.com';
    await _firebaseFirestore
        .collection("FCMtokens")
        .where("email", isEqualTo: email)
        .where("token", isEqualTo: token)
        .get()
        .then((value) => value.size > 0 ? exists = true : exists = false);

    if (exists) {
      final doc = await _firebaseFirestore
          .collection("FCMtokens")
          .where("email", isEqualTo: email)
          .where("token", isEqualTo: token)
          .get()
          .then((value) => value.docs.first.id.toString());

      await _firebaseFirestore.collection("FCMtokens").doc(doc).delete();

      //_firebaseFirestore.collection("FCMtokens").doc(doc).delete()
    }

    // _firebaseFirestore.doc(id).delete();

    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
        _firebaseMessaging.deleteToken(),
      ]);
    } catch (e) {
      throw Exception(e);
    }
  }

  static const userCacheKey = '__user_cache_key__';
  //static const userAppCacheKey = '__user_app_cache_key';

  models.FirebaseUser get currentUser {
    return _cache.read<models.FirebaseUser>(key: userCacheKey) ??
        models.FirebaseUser.empty;
  }

  // models.User get currentUserApp {
  //   return _cache.read<models.User>(key: userAppCacheKey) ?? models.User.empty;
  // }

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
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      await _firebaseAuth.currentUser!.updateDisplayName(username);
      await _firebaseAuth.currentUser!.updatePhotoURL(
          'https://t3.ftcdn.net/jpg/03/58/90/78/360_F_358907879_Vdu96gF4XVhjCZxN2kCG0THTsSQi8IhT.jpg');

      // _firebaseAuth.currentUser!.reload();

      // await _firebaseFirestore.collection('users');
      await _firebaseFirestore.collection('users').doc().set({
        'uid': _firebaseAuth.currentUser!.uid,
        'username': username,
        'email': _firebaseAuth.currentUser!.email,
        'age': 0,
        'sex': '',
        'phoneNumber': '',
        'photoUrl':
            'https://t3.ftcdn.net/jpg/03/58/90/78/360_F_358907879_Vdu96gF4XVhjCZxN2kCG0THTsSQi8IhT.jpg',
        'favorites_negocios': [],
        'favorites_products': [],
        'token': '',
        'first_login': true,
      });

      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception('Este email ya se encuentra en uso!');
      }
      if (e.code == 'invalid-email') {
        throw Exception('Este email no es valido');
      }
      if (e.code == 'operation-not-allowed') {
        throw Exception('Operacion no permitida');
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

  @override
  Future<void> deleteUser() async {
    bool exists = false;
    final token = await _firebaseMessaging.getToken();
    final email = _firebaseAuth.currentUser!.email!;
    await _firebaseFirestore
        .collection("FCMtokens")
        .where("email", isEqualTo: email)
        .where("token", isEqualTo: token)
        .get()
        .then((value) => value.size > 0 ? exists = true : exists = false);

    if (exists) {
      final doc = await _firebaseFirestore
          .collection("FCMtokens")
          .where("email", isEqualTo: email)
          .where("token", isEqualTo: token)
          .get()
          .then((value) => value.docs.first.id.toString());

      await _firebaseFirestore.collection("FCMtokens").doc(doc).delete();
    }

    await _firebaseFirestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((value) => value.size > 0 ? exists = true : exists = false);

    if (exists) {
      final user = await _firebaseFirestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get()
          .then((value) => value.docs.first.id.toString());

      await _firebaseFirestore.collection('users').doc(user).delete();
    }

    await _firebaseAuth.currentUser?.delete();
  }

  // Future<void> updateMissingUserProperties(User user) async {
  //   if (user.photoURL == null) {
  //     user.providerData.forEach((provider) async {
  //       if (provider.photoURL != null) {
  //         await user.updatePhotoURL(provider.photoURL);
  //         return;
  //       }
  //     });
  //   }
  //   if (user.displayName == null) {
  //     user.providerData.forEach((provider) async {
  //       if (provider.displayName != null) {
  //         await user.updateDisplayName(provider.displayName);
  //         return;
  //       }
  //     });
  //   }
  // }
}
