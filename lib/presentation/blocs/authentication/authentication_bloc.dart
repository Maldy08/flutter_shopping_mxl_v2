import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/repositories/firebase_auth_repository_impl.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuthRepositoryImpl firebaseAuthRepositoryImpl;

  AuthenticationBloc(this.firebaseAuthRepositoryImpl)
      : super(const AuthenticationState()) {
    on<GoogleSignInRequested>(_onGoogleSignInRequest);
  }

  void _onGoogleSignInRequest(
      GoogleSignInRequested event, Emitter<AuthenticationState> emit) {
    firebaseAuthRepositoryImpl.signInWithGoogle();
    emit(state.copyWith(
      status: AuthenticationStatus.authenticated,
    ));
  }
}
