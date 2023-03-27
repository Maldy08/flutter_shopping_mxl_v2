import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/repositories/firebase_auth_repository_impl.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/shared/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuthRepositoryImpl _firebaseAuthRepositoryImpl;

  LoginCubit(this._firebaseAuthRepositoryImpl) : super(const LoginState());

  Future<void> logInWithGoogle() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(isPosting: true));
    try {
      await _firebaseAuthRepositoryImpl.signInWithGoogle();
      emit(state.copyWith(isPosting: false));
    } catch (_) {
      emit(state.copyWith(isPosting: false));
    }
  }

  Future<void> loginWithEmaildAndPassword(String email, String password) async {
    emit(state.copyWith(isPosting: true));
    try {
      await _firebaseAuthRepositoryImpl.signIn(email, password);
      emit(state.copyWith(isPosting: false));
    } catch (_) {
      emit(state.copyWith(isPosting: false));
    }
  }

  onEmailChange(String value) {
    final newEmail = Email.dirty(value);
    emit(
      state.copyWith(
        email: newEmail,
        isValid: Formz.validate([newEmail, state.password]),
      ),
    );
  }

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    emit(
      state.copyWith(
        password: newPassword,
        isValid: Formz.validate([newPassword, state.email]),
      ),
    );
  }

  void onSubmit() {
    emit(
      state.copyWith(
        isPosting: true,
        email: Email.dirty(state.email.value),
        password: Password.dirty(state.password.value),
        isValid: Formz.validate([state.email, state.password]),
      ),
    );
  }
}
