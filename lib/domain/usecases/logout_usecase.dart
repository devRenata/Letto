import '../repositories/auth_repository.dart';

class LogoutUsecase {
  final IAuthRepository authRepository;

  LogoutUsecase({required this.authRepository});

  Future<void> call() {
    return authRepository.logout();
  }
}