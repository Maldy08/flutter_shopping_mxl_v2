import 'package:flutter_shopping_mxl_v2/domain/repositories/user_repository.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/datasources/firebase_user_datasource.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/user.dart';

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
}
