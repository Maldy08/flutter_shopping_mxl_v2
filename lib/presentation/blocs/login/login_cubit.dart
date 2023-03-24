import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/repositories/firebase_auth_repository_impl.dart';
import 'package:formz/formz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuthRepositoryImpl _firebaseAuthRepositoryImpl;

  LoginCubit(this._firebaseAuthRepositoryImpl) : super(const LoginState());

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _firebaseAuthRepositoryImpl.signInWithGoogle();
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  Future<void> loginWithEmaildAndPassword(String email, String password) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _firebaseAuthRepositoryImpl.signIn(email, password);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
