import '../../infrastructure/models/models.dart';

abstract class FCMtokensRepository {
  Future<List<FCMtokens>> getAllTokens();
  Future<List<FCMtokens>> getTokensByUser({required String email});
  Future<void> saveToken({
    required String email,
    required String uid,
    required String token,
  });
}
