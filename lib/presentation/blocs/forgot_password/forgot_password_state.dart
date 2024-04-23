part of 'forgot_password_cubit.dart';

class ForgotPasswordState extends Equatable {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final String? errorMessage;
  final Email email;
  final FormzSubmissionStatus status;

  const ForgotPasswordState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.errorMessage,
    this.email = const Email.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  ForgotPasswordState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    String? errorMessage,
    Email? email,
    FormzSubmissionStatus? status,
  }) {
    return ForgotPasswordState(
      isPosting: isPosting ?? this.isPosting,
      isFormPosted: isFormPosted ?? this.isFormPosted,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props =>
      [isPosting, isFormPosted, isValid, email, errorMessage, status];
}
