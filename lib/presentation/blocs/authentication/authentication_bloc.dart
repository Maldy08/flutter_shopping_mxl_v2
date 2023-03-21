import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState()) {
    on<GoogleSignInRequested>(_onGoogleSignInRequest);
  }

  void _onGoogleSignInRequest(
      GoogleSignInRequested event, Emitter<AuthenticationState> emit) async {
    //FirebaseAuthDatasource firebaseAuthDatasource =
    //  FirebaseAuthDatasource(FirebaseAuth.instance);
    //FirebaseAuthRepositoryImpl firebaseAuthRepositoryImpl =
    //  FirebaseAuthRepositoryImpl(firebaseAuthDatasource);

    emit(state.copyWith(
      status: AuthenticationStatus.authenticating,
      user: null,
    ));
    await signInWithGoogle();

    // firebaseAuthRepositoryImpl.signInWithGoogle();
    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(
      status: AuthenticationStatus.authenticated,
      user: FirebaseAuth.instance.currentUser,
    ));
  }

  void onGoogleSingIn() {
    add(GoogleSignInRequested());
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn().signIn().catchError(
                (onError) => print('Error $onError'),
              );

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      // await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
