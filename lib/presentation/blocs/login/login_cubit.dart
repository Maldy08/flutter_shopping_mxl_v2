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

  Future<void> _loginWithEmaildAndPassword(
      String email, String password) async {
    emit(state.copyWith(isPosting: true));
    try {
      await _firebaseAuthRepositoryImpl.signIn(email, password);
      emit(state.copyWith(isPosting: false));
    } on Exception catch (e) {
      emit(
        state.copyWith(errorMessage: e.toString(), isFormPosted: true),
      );
    } catch (_) {
      emit(state.copyWith(isPosting: false, errorMessage: null));
    }
  }

  _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);

    emit(state.copyWith(
        isFormPosted: true,
        email: email,
        password: password,
        isPosting: Formz.validate([email, password])));
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

  Future<void> onSubmit() async {
    _touchEveryField();
    if (!state.isValid) return;
    await _loginWithEmaildAndPassword(state.email.value, state.password.value);
  }
}
