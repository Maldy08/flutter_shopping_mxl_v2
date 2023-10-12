import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  const User({
    required this.age,
    required this.email,
    required this.favoritesNegocios,
    required this.favoritesProducts,
    required this.phoneNumber,
    required this.photoUrl,
    required this.sex,
    required this.uid,
    required this.username,
  });

  final int? age;
  final String email;
  final List<FavoritesNegocio> favoritesNegocios;
  final List<FavoritesProduct> favoritesProducts;
  final String? phoneNumber;
  final String? photoUrl;
  final String? sex;
  final String uid;
  final String username;

  static const empty = User(
    age: 0,
    email: '',
    favoritesNegocios: [],
    favoritesProducts: [],
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
        favoritesNegocios: List<FavoritesNegocio>.from(
            json["favorites_negocios"]
                .map((x) => FavoritesNegocio.fromJson(x))),
        favoritesProducts: List<FavoritesProduct>.from(
            json["favorites_products"]
                .map((x) => FavoritesProduct.fromJson(x))),
        phoneNumber: json["phoneNumber"],
        photoUrl: json["photoUrl"],
        sex: json["sex"],
        uid: json["uid"],
        username: json["username"],
      );
  Map<String, dynamic> toJson() => {
        "age": age,
        "email": email,
        "favorites_negocios":
            List<dynamic>.from(favoritesNegocios.map((x) => x.toJson())),
        "favorites_products":
            List<dynamic>.from(favoritesProducts.map((x) => x.toJson())),
        "phoneNumber": phoneNumber,
        "photoUrl": photoUrl,
        "sex": sex,
        "uid": uid,
        "username": username,
      };
}

class FavoritesNegocio {
  final String idnegocio;

  const FavoritesNegocio({
    required this.idnegocio,
  });

  factory FavoritesNegocio.fromJson(Map<String, dynamic> json) =>
      FavoritesNegocio(
        idnegocio: json["idnegocio"],
      );

  Map<String, dynamic> toJson() => {
        "idnegocio": idnegocio,
      };
}

class FavoritesProduct {
  String idproducto;

  FavoritesProduct({
    required this.idproducto,
  });

  factory FavoritesProduct.fromJson(Map<String, dynamic> json) =>
      FavoritesProduct(
        idproducto: json["idproducto"],
      );

  Map<String, dynamic> toJson() => {
        "idproducto": idproducto,
      };
}
