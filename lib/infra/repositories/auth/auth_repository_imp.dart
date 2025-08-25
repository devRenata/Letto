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
    } catch (e) {
      throw authExceptionHandler.handle(e as Exception);
    }
  }

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw authExceptionHandler.handle(e as Exception);
    }
  }
}
