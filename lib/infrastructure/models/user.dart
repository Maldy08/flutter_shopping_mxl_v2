enum Genre { male, female, other }

enum Intereses {
  tiendasDeRopa,
  esteticas,
  barberias,
  supermercados,
  restaurantes,
}

class User {
  final String uid;
  final String name;

  final int age;
  final Genre genre;
  final String email;
  final String password;
  final String phoneNumber;
  final List<Intereses>? intereses;
  final String? photoUrl;
  //final Location location;

  User({
    required this.uid,
    required this.name,
    required this.age,
    required this.genre,
    required this.email,
    required this.password,
    required this.phoneNumber,
    String? photoUrl,
    this.intereses,
    //required this.location,
  }) : photoUrl = photoUrl ?? 'no-photo';
}

//coleccition users..