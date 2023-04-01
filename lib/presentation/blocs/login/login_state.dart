part of 'login_cubit.dart';

class LoginState extends Equatable {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final String? errorMessage;
  final Email email;
  final Password password;
  final FormzSubmissionStatus status;

  const LoginState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.errorMessage,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  LoginState copyWith(
      {bool? isPosting,
      bool? isFormPosted,
      bool? isValid,
      String? errorMessage,
      Email? email,
      Password? password,
      FormzSubmissionStatus? status}) {
    return LoginState(
      isPosting: isPosting ?? this.isPosting,
      isFormPosted: isFormPosted ?? this.isFormPosted,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props =>
      [isPosting, isFormPosted, isValid, email, password, errorMessage, status];

  @override
  String toString() {
    return '''
  LoginFormState:
    isPosting: $isPosting
    isFormPosted: $isFormPosted
    isValid: $isValid
    errorMessage:$errorMessage
    email: $email
    password: $password
    status: $status
''';
  }
}
