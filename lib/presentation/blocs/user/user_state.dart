part of 'user_bloc.dart';

enum UserStatus {
  fetching,
  completed,
}

class UserState extends Equatable {
  final UserStatus status;
  final User user;

  const UserState({
    this.status = UserStatus.fetching,
    this.user = User.empty,
  });

  UserState copyWith({
    UserStatus? status,
    User? user,
  }) =>
      UserState(
        status: status ?? this.status,
        user: user ?? this.user,
      );
  @override
  List<Object> get props => [status, user];
}
