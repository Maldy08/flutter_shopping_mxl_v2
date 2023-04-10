// enum Genre { male, female, other }

// enum Intereses {
//   tiendasDeRopa,
//   esteticas,
//   barberias,
//   supermercados,
//   restaurantes,
// }

class User {
  final String uid;
  final String username;

  final int age;
  //final Genre genre;
  final String email;
  // final String password;
  final String phoneNumber;
  final String sex;
  //final List<Intereses>? intereses;
  final String? photoUrl;
  //final Location location;

  User({
    required this.uid,
    required this.username,
    required this.age,
    // required this.genre,
    required this.email,
    // required this.password,
    required this.phoneNumber,
    required this.sex,
    String? photoUrl,
    // this.intereses,
    //required this.location,
  }) : photoUrl = photoUrl ?? 'no-photo';

  factory User.fromJson(Map<String, dynamic> json) => User(
        age: json["age"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        photoUrl: json["photoUrl"],
        sex: json["sex"],
        uid: json["uid"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "email": email,
        "phoneNumber": phoneNumber,
        "photoUrl": photoUrl,
        "sex": sex,
        "uid": uid,
        "username": username,
      };
}

//coleccition users..