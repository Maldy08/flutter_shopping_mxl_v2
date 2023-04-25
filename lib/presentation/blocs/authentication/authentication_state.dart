part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  checking,
  authenticated,
  notauthenticated,
}

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final FirebaseUser user;
  final User userApp;

  const AuthenticationState({
    this.status = AuthenticationStatus.checking,
    this.user = FirebaseUser.empty,
    this.userApp = User.empty,
  });

  // AuthenticationState copyWith({
  //   FirebaseUser? user,
  //   AuthenticationStatus? status,
  // }) {
  //   return AuthenticationState(
  //     user: user ?? this.user,
  //     status: status ?? this.status,
  //   );
  // }

  const AuthenticationState.authenticated(FirebaseUser user, User userApp)
      : this(
            status: AuthenticationStatus.authenticated,
            user: user,
            userApp: userApp);

  const AuthenticationState.notauthenticated()
      : this(status: AuthenticationStatus.notauthenticated);

  @override
  List<Object> get props => [status, user, userApp];
}
