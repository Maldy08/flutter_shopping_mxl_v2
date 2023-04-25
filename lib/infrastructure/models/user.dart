import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  const User({
    required this.age,
    required this.email,
    required this.favorites,
    required this.phoneNumber,
    required this.photoUrl,
    required this.sex,
    required this.uid,
    required this.username,
  });

  final int? age;
  final String email;
  final Favorites? favorites;
  final String? phoneNumber;
  final String? photoUrl;
  final String uid;
  final String? sex;
  final String username;

  static const empty = User(
    age: 0,
    email: '',
    favorites: null,
    phoneNumber: '',
    photoUrl: '',
    sex: '',
    uid: '',
    username: '',
  );

  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  factory User.fromJson(Map<String, dynamic> json) => User(
        age: json["age"],
        email: json["email"],
        favorites: Favorites.fromJson(json["favorites"]),
        phoneNumber: json["phoneNumber"],
        photoUrl: json["photoUrl"],
        sex: json["sex"],
        uid: json["uid"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "email": email,
        "favorites": favorites!.toJson(),
        "phoneNumber": phoneNumber,
        "photoUrl": photoUrl,
        "sex": sex,
        "uid": uid,
        "username": username,
      };
}

class Favorites {
  Favorites({
    required this.negocios,
    required this.productos,
  });

  List<UserFavoritesNegocios> negocios;
  List<UserFavoritesProductos> productos;

  factory Favorites.fromJson(Map<String, dynamic> json) => Favorites(
        negocios: UserFavoritesNegocios.fromJson(json["negocios"]),
        productos: UserFavoritesProductos.fromJson(json["productos"]),
      );

  Map<String, dynamic> toJson() => {
        "negocios": negocios.toJson(),
        "productos": productos.toJson(),
      };
}

class UserFavoritesNegocios {
  UserFavoritesNegocios();

  factory UserFavoritesNegocios.fromJson(Map<String, dynamic> json) =>
      UserFavoritesNegocios();

  Map<String, dynamic> toJson() => {};
}

class UserFavoritesProductos {
  UserFavoritesProductos();

  factory UserFavoritesProductos.fromJson(Map<String, dynamic> json) =>
      UserFavoritesProductos();
  Map<String, dynamic> toJson() => {};
}
