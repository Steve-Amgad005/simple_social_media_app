import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth_domain/auth_domain_repositories/auth_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo repository;

  AuthCubit(this.repository) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());

    try {
      final user = await repository.login(email: email, password: password);

      emit(AuthSuccess(message: "Welcome!"));
    } catch (e) {
      emit(AuthError(message: e.toString()));
      print(e.toString());
    }
  }

  Future<void> signup(
    String email,
    String username,
    String password,
    String name,
  ) async {
    emit(AuthLoading());
    try {
      final user = await repository.signup(
        email: email,
        username: username,
        password: password,
        name: name,
      );

      emit(AuthSuccess(message: "Welcome!"));
    } catch (e) {
      emit(AuthError(message: e.toString()));
      print(e.toString());
    }
  }
}
