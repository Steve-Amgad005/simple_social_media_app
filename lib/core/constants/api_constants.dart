import 'package:dio/dio.dart';

class ApiConstants {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://sm-apis-i6yq.onrender.com",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );
}