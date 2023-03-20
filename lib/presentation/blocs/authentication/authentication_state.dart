part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  unknown,
  authenticated,
  notauthenticated,
}

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final User? user;

  const AuthenticationState({
    this.status = AuthenticationStatus.unknown,
    this.user,
  });

  AuthenticationState copyWith({
    User? user,
    AuthenticationStatus? status,
  }) {
    return AuthenticationState(
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status, user!];
}
