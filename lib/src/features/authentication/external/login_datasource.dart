import 'package:dio/dio.dart';
import 'package:ecorporativo/src/features/authentication/data/datasources/login_datasource.dart';
import 'package:ecorporativo/src/features/authentication/data/models/user_model.dart';

class LoginDatasourceImpl implements LoginDatasource {
  @override
  Future<UserModel> call({
    required String login,
    required String password,
  }) async {
    try {
      final dio = Dio();
      dio.options.headers["X-Custom-Api-Key"] =
          "Token fc3b4ca30130eb7bd06b534e164f93b611b9caad";
      dio.options.headers["Authorization"] =
          "Token c683306d16bf3b9c9aa6b6b360355028b3803bc2";
      dio.options.headers["Content-Type"] = "application/json";
      final response = await dio.get(
        'https://api-mobile.ecorp-isp.com.br/recursos/validaCredenciais/',
        data: {
          "login": int.parse(login),
          "senha": int.parse(password),
          "chave": "idcorpbrasil-isp.tins.com.br"
        },
      );
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
