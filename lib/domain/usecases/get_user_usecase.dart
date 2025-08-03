import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class GetUserUsecase {
  final IAuthRepository authRepository;

  GetUserUsecase({required this.authRepository});

  Future<User> call({required String id}) async {
    final user = await authRepository.getUser(id: id);
    return User.fromJson(user);
  }
}