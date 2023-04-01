import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/infrastructure.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/shared/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final FirebaseAuthRepositoryImpl _firebaseAuthRepositoryImpl;

  RegisterCubit(this._firebaseAuthRepositoryImpl)
      : super(const RegisterState());

  onUsernameChanged(String value) {
    final newUsername = Username.dirty(value);
    emit(state.copyWith(
      username: newUsername,
      isValid: Formz.validate([
        newUsername,
        state.email,
        state.password,
        // state.age,
        // state.sex,
        // state.phoneNumber
      ]),
    ));
  }

  onEmailChange(String value) {
    final newEmail = Email.dirty(value);
    emit(
      state.copyWith(
        email: newEmail,
        isValid: Formz.validate([
          newEmail,
          state.username,
          state.password,
          // state.age,
          // state.sex,
          // state.phoneNumber,
        ]),
      ),
    );
  }

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    emit(
      state.copyWith(
        password: newPassword,
        isValid: Formz.validate([
          newPassword,
          state.username,
          state.email,
          // state.age,
          // state.sex,
          // state.phoneNumber,
        ]),
      ),
    );
  }

  // onAgeChanged(String value) {
  //   final newAge = Age.dirty(value);
  //   emit(state.copyWith(
  //     age: newAge,
  //     isValid: Formz.validate([
  //       newAge,
  //       state.username,
  //       state.email,
  //       state.password,
  //       state.sex,
  //       state.phoneNumber,
  //     ]),
  //   ));
  // }

  // onSexChanged(String value) {
  //   final newSex = Sex.dirty(value);
  //   emit(state.copyWith(
  //     sex: newSex,
  //     isValid: Formz.validate([
  //       newSex,
  //       state.username,
  //       state.email,
  //       state.password,
  //       state.age,
  //       state.sex,
  //       state.phoneNumber,
  //     ]),
  //   ));
  // }

  // onPhoneChange(String value) {
  //   final newPhone = PhoneNumber.dirty(value);
  //   emit(state.copyWith(
  //     phoneNumber: newPhone,
  //     isValid: Formz.validate([
  //       newPhone,
  //       state.username,
  //       state.email,
  //       state.password,
  //       state.age,
  //       state.sex,
  //     ]),
  //   ));
  // }

  void onSubmit() async {
    _touchEveryField();
    if (!state.isValid) return;
    await _singUp(
      state.username.value,
      state.email.value,
      state.password.value,
    );
  }

  _touchEveryField() {
    final username = Username.dirty(state.username.value);
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);

    emit(state.copyWith(
        isFormPosted: true,
        username: username,
        email: email,
        password: password,
        status: FormzSubmissionStatus.inProgress,
        isPosting: Formz.validate([username, email, password])));
  }

  Future<void> _singUp(String username, String email, String password) async {
    emit(state.copyWith(
        isPosting: true, status: FormzSubmissionStatus.inProgress));
    //await Future.delayed(const Duration(seconds: 2));
    //emit(state.copyWith(isPosting: false));
    try {
      await _firebaseAuthRepositoryImpl.registerUser(
        username: username,
        email: email,
        password: password,
      );
    } catch (e) {
      emit(state.copyWith(
        isPosting: false,
        status: FormzSubmissionStatus.failure,
        errorMessage: e.toString(),
      ));
    }
    emit(state.copyWith(
      isPosting: false,
      status: FormzSubmissionStatus.initial,
    ));
  }
}
