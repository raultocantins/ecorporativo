import 'package:ecorporativo/src/features/authentication/data/datasources/login_datasource.dart';
import 'package:ecorporativo/src/features/authentication/data/models/user_model.dart';
import 'package:ecorporativo/src/shared/utils/dio.dart';

class LoginDatasourceImpl implements LoginDatasource {
  @override
  Future<UserModel> call({
    required String login,
    required String password,
  }) async {
    try {
      final response = await HttpService().dio.get(
        'recursos/validaCredenciais/',
        data: {"login": login, "senha": password, "chave": HttpService().chave},
      );
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
