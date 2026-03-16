import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../auth_data_models/user_model.dart';

class AuthRemoteDataSource {

  final Dio dio;

  AuthRemoteDataSource({Dio? dio}) : dio = dio ?? ApiConstants.dio;

  Future<UserModel> signup({
    required String? email,
    required String? username,
    required String? password,
    required String? name,
  }) async {
    try {
      final response = await dio.post(
        "https://sm-apis-i6yq.onrender.com/api/auth/register",
        data: {
          "email": email,
          "username": username,
          "password": password,
          "name": name,
        },
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response?.data["message"] ?? "Unknown error");
      } else {
        throw Exception("Network error");
      }
    }
  }

  Future<UserModel> login({
    required String? email,
    required String? password,
  }) async {
    final response = await dio.post(
      "https://sm-apis-i6yq.onrender.com/api/auth/login",
      data: {
        "email": email,
        "password": password,
      },
    );

    return UserModel.fromJson(response.data);
  }

}