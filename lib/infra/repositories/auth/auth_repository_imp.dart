import 'package:firebase_auth/firebase_auth.dart';
import 'package:letto/domain/repositories/auth_repository.dart';
import 'package:letto/domain/services/auth/auth_exception_handler.dart';

class AuthRepositoryImp implements IAuthRepository {
  final FirebaseAuth firebaseAuth;
  final IAuthExceptionHandler authExceptionHandler;

  AuthRepositoryImp({
    required this.firebaseAuth,
    required this.authExceptionHandler,
  });

  @override
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw authExceptionHandler.handle(e);
    } catch (e) {
      
    }
  }

  @override
  Future<Map<String, dynamic>> getUser({required String id}) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<void> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
