import 'package:dio/dio.dart';
import 'package:ecorporativo/src/features/home/data/models/helpdesk_list_model.dart';
import '../data/datasources/get_helpdesk_datasource.dart';

class GetHelpDeskDatasourceImpl implements GetHelpDeskDatasource {
  @override
  Future<HelpDeskListModel> call({
    required int userId,
  }) async {
    try {
      final dio = Dio();
      dio.options.headers["X-Custom-Api-Key"] =
          "Token fc3b4ca30130eb7bd06b534e164f93b611b9caad";
      dio.options.headers["Authorization"] =
          "Token c683306d16bf3b9c9aa6b6b360355028b3803bc2";
      dio.options.headers["Content-Type"] = "application/json";
      final response = await dio.get(
        'https://api-mobile.ecorp-isp.com.br/recursos/consultaHelpDesk/',
        data: {
          "codigo_cliente": userId,
          "chave": "idcorpbrasil-isp.tins.com.br"
        },
      );
      return HelpDeskListModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
