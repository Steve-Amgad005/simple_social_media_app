import 'package:simple_social_media_app/features/auth/auth_domain/auth_domain_repositories/auth_repo.dart';

class SignUpUseCase {
  final AuthRepo repo;

  SignUpUseCase(this.repo);

  Future call(String email, String password, String username, String name) {
    return repo.signup(
      email: email,
      password: password,
      username: username,
      name: name,
    );
  }
}
