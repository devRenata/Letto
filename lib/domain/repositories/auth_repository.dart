abstract interface class IAuthRepository {
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
  
  Future<void> login({
    required String email,
    required String password,
  });
  Future<Map<String, dynamic>> getUser({required String id});
  Future<void> logout();
}
