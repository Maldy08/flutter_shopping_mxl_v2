import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/shared/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  onUsernameChanged(String value) {
    final newUsername = Username.dirty(value);
    emit(state.copyWith(
      username: newUsername,
      isValid: Formz.validate([newUsername, state.email, state.password]),
    ));
  }

  onEmailChange(String value) {
    final newEmail = Email.dirty(value);
    emit(
      state.copyWith(
        email: newEmail,
        isValid: Formz.validate(
            [newEmail, state.password, state.username, state.age]),
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

  onAgeChanged(String value) {
    final newAge = Age.dirty(value);
    emit(state.copyWith(
      age: newAge,
      isValid:
          Formz.validate([newAge, state.email, state.password, state.username]),
    ));
  }

  onSexChanged(String value) {
    final newSex = Sex.dirty(value);
    emit(state.copyWith(
      sex: newSex,
      isValid: Formz.validate(
          [newSex, state.email, state.password, state.username, state.age]),
    ));
  }

  onPhoneChange(String value) {
    final newPhone = PhoneNumber.dirty(value);
    emit(state.copyWith(
      phoneNumber: newPhone,
      isValid: Formz.validate(
          [newPhone, state.email, state.password, state.username, state.age]),
    ));
  }
}
