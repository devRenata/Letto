import '../repositories/auth_repository.dart';

class LoginUsecase {
  final IAuthRepository authRepository;

  LoginUsecase({required this.authRepository});

  Future<void> call({required String email, required String password}) {
    return authRepository.login(email: email, password: password);
  }
}