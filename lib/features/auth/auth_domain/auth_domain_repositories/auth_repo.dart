import '../auth_domain_entities/user_entity.dart';

abstract class AuthRepo {
  Future<Users> login({
    required String email,
    required String password,
  });

  Future<Users> signup({
    required String email,
    required String password,
    required String username,
    required String name,
  });
}