import '../../domain/repositories/fcmtokens_repository.dart';
import '../datasources/firebase_fcmtokens_datasource.dart';
import '../models/models.dart';

class FirebaseFCMtokensRepositoryImpl extends FCMtokensRepository {
  final FirebaseFCMtokensDataSource dataSource;

  FirebaseFCMtokensRepositoryImpl({FirebaseFCMtokensDataSource? dataSource})
      : dataSource = dataSource ?? FirebaseFCMtokensDataSource();

  @override
  Future<List<FCMtokens>> getAllTokens() {
    return dataSource.getAllTokens();
  }

  @override
  Future<List<FCMtokens>> getTokensByUser({required String email}) {
    return dataSource.getTokensByUser(email: email);
  }

  @override
  Future<void> saveToken(
      {required String email, required String uid, required String token}) {
    return dataSource.saveToken(email: email, uid: uid, token: token);
  }
}
