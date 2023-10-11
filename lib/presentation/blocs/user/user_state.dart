part of 'user_bloc.dart';

enum UserStatus {
  fetching,
  completed,
}

class UserState extends Equatable {
  final UserStatus status;
  final User user;
  final bool isFavorite;
  final bool isFavoriteProduct;

  const UserState({
    this.status = UserStatus.fetching,
    this.user = User.empty,
    this.isFavorite = false,
    this.isFavoriteProduct = false,
  });

  UserState copyWith({
    UserStatus? status,
    User? user,
    bool? isFavorite,
    bool? isFavoriteProduct,
  }) =>
      UserState(
          status: status ?? this.status,
          user: user ?? this.user,
          isFavorite: isFavorite ?? this.isFavorite,
          isFavoriteProduct: isFavoriteProduct ?? this.isFavoriteProduct);
  @override
  List<Object> get props => [status, user, isFavorite, isFavoriteProduct];
}
