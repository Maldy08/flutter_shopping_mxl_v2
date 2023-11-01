import '../models/fcmtokens.dart';

class FCMtokensMapper {
  static FCMtokens fcmtokensToEntity(FCMtokens fcMtokens) => FCMtokens(
        email: fcMtokens.email,
        token: fcMtokens.token,
        uid: fcMtokens.uid,
      );
}
