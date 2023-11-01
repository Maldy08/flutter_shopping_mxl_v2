import '../../domain/repositories/user_repository.dart';
import '../datasources/firebase_user_datasource.dart';
import '../models/models.dart';

class FirebaseUserRepositoryImpl extends UserRepository {
  final FirebaseUserDatasource dataSource;
  FirebaseUserRepositoryImpl({FirebaseUserDatasource? dataSource})
      : dataSource = dataSource ?? FirebaseUserDatasource();

  @override
  Future<User?> getCurrentAppUser({required String email}) {
    return dataSource.getCurrentAppUser(email: email);
  }

  @override
  Future<bool> isUserExists({required String email}) {
    return dataSource.isUserExists(email: email);
  }

  @override
  Future<void> toogleFavorite({required User user}) {
    return dataSource.toogleFavorite(user: user);
  }

  @override
  Future<void> saveToken({required String email, required String token}) {
    return dataSource.saveToken(email: email, token: token);
  }
}
