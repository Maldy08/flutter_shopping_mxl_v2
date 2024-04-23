import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../infrastructure/infrastructure.dart';
import '../../widgets/shared/inputs/inputs.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final FirebaseAuthRepositoryImpl _firebaseAuthRepositoryImpl;

  ForgotPasswordCubit({FirebaseAuthRepositoryImpl? firebaseAuthRepositoryImpl})
      : _firebaseAuthRepositoryImpl =
            firebaseAuthRepositoryImpl ?? FirebaseAuthRepositoryImpl(),
        super(const ForgotPasswordState());

  onEmailChange(String value) {
    final newEmail = Email.dirty(value);
    emit(
      state.copyWith(
        email: newEmail,
        isValid: Formz.validate([
          newEmail,
          // state.age,
          // state.sex,
          // state.phoneNumber,
        ]),
      ),
    );
  }

  Future<void> _submitForm() async {
    if (!state.isValid) return;
    emit(state.copyWith(
        isPosting: true,
        email: Email.dirty(state.email.value),
        isValid: Formz.validate([Email.dirty(state.email.value)])));
    try {
      await _firebaseAuthRepositoryImpl
          .resetPassword(email: state.email.value)
          .then((_) {
        emit(state.copyWith(
          isPosting: false,
          status: FormzSubmissionStatus.success,
          errorMessage: null,
        ));
      });
    } catch (e) {
      emit(state.copyWith(
        isPosting: false,
        errorMessage: e.toString(),
        status: FormzSubmissionStatus.failure,
      ));
    }

    // emit(state.copyWith(
    //   isPosting: false,
    //   status: FormzSubmissionStatus.initial,
    // ));
  }

  Future<void> resetPassword() async {
    _submitForm();
  }
}
