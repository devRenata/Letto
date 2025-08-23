import 'package:firebase_auth/firebase_auth.dart';
import 'package:letto/domain/exceptions/auth/auth_exception.dart';
import 'package:letto/domain/services/auth/auth_exception_handler.dart';

class AuthExceptionHandlerImp implements IAuthExceptionHandler {
  @override
  AuthException handle(Exception exception) {
    if (exception is FirebaseAuthException) {
      return _convertFirebaseAuthException(exception);
    } else {
      return AuthException(
        message: 'Erro de autenticação desconhecido.',
        code: 'unknown-error',
      );
    }
  }

  AuthException _convertFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return AuthException(
          message: 'Este email já está em uso.',
          code: 'email-already-in-use',
        );
      case 'invalid-email':
        return AuthException(
          message: 'O email é inválido.',
          code: 'invalid-email',
        );
      case 'operation-not-allowed':
        return AuthException(
          message: 'Autenticação não permitida por email.',
          code: 'operation-not-allowed',
        );
      case 'weak-password':
        return AuthException(
          message: 'A senha é muito fraca.',
          code: 'weak-password',
        );
      case 'too-many-requests':
        return AuthException(
          message: 'Muitas tentativas. Tente novamente mais tarde.',
          code: 'too-many-requests',
        );
      case 'user-token-expired':
        return AuthException(
          message: 'Código expirado, tente novamente.',
          code: 'user-token-expired',
        );
      case 'network-request-failed':
        return AuthException(
          message: 'Sem conexão com a internet.',
          code: 'network-request-failed',
        );
      default:
        return AuthException(
        message: 'Erro de autenticação desconhecido.',
        code: 'unknown-error',
      );
    }
  }
}