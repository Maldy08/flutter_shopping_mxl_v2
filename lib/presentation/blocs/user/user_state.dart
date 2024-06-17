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
  final List<Negocios> negocios;

  const UserState({
    this.status = UserStatus.fetching,
    this.user = User.empty,
    this.isFavorite = false,
    this.isFavoriteProduct = false,
    this.negocios = const [],
  });

  UserState copyWith({
    UserStatus? status,
    User? user,
    bool? isFavorite,
    bool? isFavoriteProduct,
    List<Negocios>? negocios,
  }) =>
      UserState(
          status: status ?? this.status,
          user: user ?? this.user,
          isFavorite: isFavorite ?? this.isFavorite,
          isFavoriteProduct: isFavoriteProduct ?? this.isFavoriteProduct,
          negocios: negocios ?? this.negocios);
  @override
  List<Object> get props =>
      [status, user, isFavorite, isFavoriteProduct, negocios];
}
