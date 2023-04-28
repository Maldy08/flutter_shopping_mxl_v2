part of 'user_bloc.dart';

enum UserStatus {
  fetching,
  completed,
}

class UserState extends Equatable {
  final UserStatus status;
  final User user;
  final bool isFavorite;

  const UserState({
    this.status = UserStatus.fetching,
    this.user = User.empty,
    this.isFavorite = false,
  });

  UserState copyWith({
    UserStatus? status,
    User? user,
    bool? isFavorite,
  }) =>
      UserState(
        status: status ?? this.status,
        user: user ?? this.user,
        isFavorite: isFavorite ?? this.isFavorite,
      );
  @override
  List<Object> get props => [status, user, isFavorite];
}
