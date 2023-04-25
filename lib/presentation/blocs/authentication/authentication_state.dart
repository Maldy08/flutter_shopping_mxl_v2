part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  checking,
  authenticated,
  notauthenticated,
}

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final FirebaseUser user;

  const AuthenticationState(
      {this.status = AuthenticationStatus.checking,
      this.user = FirebaseUser.empty});

  // AuthenticationState copyWith({
  //   FirebaseUser? user,
  //   AuthenticationStatus? status,
  // }) {
  //   return AuthenticationState(
  //     user: user ?? this.user,
  //     status: status ?? this.status,
  //   );
  // }

  const AuthenticationState.authenticated(FirebaseUser user)
      : this(
          status: AuthenticationStatus.authenticated,
          user: user,
        );

  const AuthenticationState.notauthenticated()
      : this(status: AuthenticationStatus.notauthenticated);

  @override
  List<Object> get props => [status, user];
}
