import 'package:simple_social_media_app/features/auth/auth_domain/auth_domain_repositories/auth_repo.dart';

class LoginUseCase {
  final AuthRepo repo;

  LoginUseCase(this.repo);

  Future call(String email, String password) {
    return repo.login(email: email, password: password);
  }
}
