import '../../auth_domain/auth_domain_entities/user_entity.dart';
import '../../auth_domain/auth_domain_repositories/auth_repo.dart';
import '../auth_data_datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepo {

  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Users> login({
    required String email,
    required String password,
  }) {
    return remoteDataSource.login(
      email: email,
      password: password,
    );
  }

  @override
  Future<Users> signup({
    required String email,
    required String username,
    required String password,
    required String name,
  }) {
    return remoteDataSource.signup(
      email: email,
      username: username,
      password: password,
      name: name,
    );
  }

}