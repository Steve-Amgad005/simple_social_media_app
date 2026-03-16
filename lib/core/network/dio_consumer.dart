import 'package:dio/dio.dart';

import 'api_consumer.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer(this.dio);

  @override
  Future get(String path) async {
    final response = await dio.get(path);

    return response.data;
  }

  @override
  Future post(String path, {data}) async {
    final response = await dio.post(path, data: data);

    return response.data;
  }
}