import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:letto/domain/exceptions/auth/auth_exception.dart';
import 'package:letto/domain/services/auth/auth_exception_handler.dart';
import 'package:letto/infra/repositories/auth/auth_repository_imp.dart';
import 'package:mocktail/mocktail.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {}
class UserCredentialMock extends Mock implements UserCredential {}
class AuthExceptionHandlerMock extends Mock implements IAuthExceptionHandler {}

void main() {
  late FirebaseAuthMock firebaseAuthMock;
  late AuthExceptionHandlerMock handlerMock;
  late AuthRepositoryImp repository;

  setUp(() {
    firebaseAuthMock = FirebaseAuthMock();
    handlerMock = AuthExceptionHandlerMock();
    repository = AuthRepositoryImp(
      firebaseAuth: firebaseAuthMock,
      authExceptionHandler: handlerMock,
    );
  });

  group("SignUp with email and password |", () {
    const email = 'test@gmail.com';
    const password = 'password123';

    test("Must create a user successfully", () async {
      when(() => firebaseAuthMock.createUserWithEmailAndPassword(
            email: email,
            password: password,
          )).thenAnswer((_) async => UserCredentialMock());

      await repository.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );

      verify(() => firebaseAuthMock.createUserWithEmailAndPassword(
            email: email,
            password: password,
          )).called(1);
    });

    test("Should throw AuthException if an error occurs", () async {
      final firebaseException = FirebaseAuthException(
        code: 'invalid-email',
        message: 'Email inválido.',
      );

      when(() => firebaseAuthMock.createUserWithEmailAndPassword(
            email: email,
            password: password,
          )).thenThrow(firebaseException);

      when(() => handlerMock.handle(firebaseException)).thenReturn(
        AuthException(
          message: 'O email é inválido.',
          code: 'invalid-email',
        ),
      );

      expect(
        () => repository.signUpWithEmailAndPassword(
          email: email,
          password: password,
        ),
        throwsA(isA<AuthException>()),
      );

      verify(() => handlerMock.handle(firebaseException)).called(1);
    });
  });

  group("SignIn with email and password |", () {
    const email = 'test@gmail.com';
    const password = 'password123';

    test("Must call FirebaseAuth with correct email and password", () async {
      when(() => firebaseAuthMock.signInWithEmailAndPassword(
            email: email,
            password: password,
          )).thenAnswer((_) async => UserCredentialMock());

      await repository.signInWithEmailAndPassword(
          email: email, password: password);

      verify(() => firebaseAuthMock.signInWithEmailAndPassword(
            email: email,
            password: password,
          )).called(1);
    });

    test("Should throw AuthException if an error occurs", () async {
      final firebaseException = FirebaseAuthException(
        code: 'wrong-password',
        message: 'Senha incorreta.',
      );

      when(
        () => firebaseAuthMock.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ),
      ).thenThrow(firebaseException);

      when(() => handlerMock.handle(firebaseException)).thenReturn(
        AuthException(
          message: 'Senha incorreta.',
          code: 'wrong-password',
        ),
      );

      expect(
        () => repository.signUpWithEmailAndPassword(
          email: email,
          password: password,
        ),
        throwsA(isA<AuthException>()),
      );

      verify(() => handlerMock.handle(firebaseException)).called(1);
    });
  });
}
