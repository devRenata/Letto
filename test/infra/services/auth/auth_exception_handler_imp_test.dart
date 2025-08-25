import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:letto/domain/exceptions/auth/auth_exception.dart';
import 'package:letto/domain/services/auth/auth_exception_handler.dart';
import 'package:letto/infra/services/auth/auth_exception_handler_imp.dart';

void main() {
  late IAuthExceptionHandler handler;

  setUp(() {
    handler = AuthExceptionHandlerImp();
  });

  test("Should map invalid-email to AuthException correctly", () {
    final exception = FirebaseAuthException(
      code: 'invalid-email',
    );

    final result = handler.handle(exception);
    
    expect(result, isA<AuthException>());
    expect(result.code, equals('invalid-email'));
  });

  test("Should map email-already-in-use to AuthException correctly", () {
    final exception = FirebaseAuthException(
      code: 'email-already-in-use',
    );

    final result = handler.handle(exception);
    
    expect(result, isA<AuthException>());
    expect(result.code, equals('email-already-in-use'));
  });

  test("Should map operation-not-allowed to AuthException correctly", () {
    final exception = FirebaseAuthException(
      code: 'operation-not-allowed',
    );

    final result = handler.handle(exception);
    
    expect(result, isA<AuthException>());
    expect(result.code, equals('operation-not-allowed'));
  });

  test("Should map weak-password to AuthException correctly", () {
    final exception = FirebaseAuthException(
      code: 'weak-password',
    );

    final result = handler.handle(exception);
    
    expect(result, isA<AuthException>());
    expect(result.code, equals('weak-password'));
  });

  test("Should map too-many-requests to AuthException correctly", () {
    final exception = FirebaseAuthException(
      code: 'too-many-requests',
    );

    final result = handler.handle(exception);
    
    expect(result, isA<AuthException>());
    expect(result.code, equals('too-many-requests'));
  });

  test("Should map user-token-expired to AuthException correctly", () {
    final exception = FirebaseAuthException(
      code: 'user-token-expired',
    );

    final result = handler.handle(exception);
    
    expect(result, isA<AuthException>());
    expect(result.code, equals('user-token-expired'));
  });

  test("Should map network-request-failed to AuthException correctly", () {
    final exception = FirebaseAuthException(
      code: 'network-request-failed',
    );

    final result = handler.handle(exception);
    
    expect(result, isA<AuthException>());
    expect(result.code, equals('network-request-failed'));
  });

  test("Should map unknown-error to AuthException correctly", () {
    final exception = FirebaseAuthException(
      code: 'unknown-error',
    );

    final result = handler.handle(exception);
    
    expect(result, isA<AuthException>());
    expect(result.code, equals('unknown-error'));
  });
}