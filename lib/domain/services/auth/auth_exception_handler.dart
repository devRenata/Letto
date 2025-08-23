import 'package:letto/domain/exceptions/auth/auth_exception.dart';

abstract class IAuthExceptionHandler {
  AuthException handle(Exception exception);
}