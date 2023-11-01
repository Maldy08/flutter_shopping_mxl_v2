import '../models/user.dart';

class UserMapper {
  static User userToEntity(User user) => User(
        uid: user.uid,
        username: user.username,
        age: user.age,
        email: user.email,
        phoneNumber: user.phoneNumber,
        sex: user.sex,
        favoritesNegocios: user.favoritesNegocios.map((e) => e).toList(),
        favoritesProducts: user.favoritesProducts.map((e) => e).toList(),
        photoUrl: user.photoUrl,
        token: user.token,
      );
}
