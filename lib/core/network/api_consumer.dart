abstract class ApiConsumer {

  Future get(String path);

  Future post(String path, {Map<String, dynamic>? data});

}