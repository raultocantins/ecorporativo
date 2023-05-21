import 'package:dio/dio.dart';

class HttpService {
  late Dio dio;

  HttpService() {
    Dio instance = Dio();
    instance.options.headers["X-Custom-Api-Key"] =
        "Token fc3b4ca30130eb7bd06b534e164f93b611b9caad";
    instance.options.headers["Authorization"] =
        "Token c683306d16bf3b9c9aa6b6b360355028b3803bc2";
    instance.options.headers["Content-Type"] = "application/json";
    instance.options.baseUrl = "https://api-mobile.ecorp-isp.com.br/";
    dio = instance;
  }
}
