import 'package:flutter_shopping_mxl_v2/infrastructure/models/user.dart';

class UserMapper {
  static User userToEntity(User user) => User(
        uid: user.uid,
        username: user.username,
        age: user.age,
        email: user.email,
        phoneNumber: user.phoneNumber,
        sex: user.sex,
      );
}
