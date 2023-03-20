abstract class AuthDatasoruce {
  Future<void> signIn({required String email, required String password});
  Future<void> singOut();
}
