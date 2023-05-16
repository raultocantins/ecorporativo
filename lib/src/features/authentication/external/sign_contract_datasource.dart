import 'package:dio/dio.dart';
import '../data/datasources/sign_contract_datasource.dart';

class SignContractDatasourceImpl implements SignContractDatasource {
  @override
  Future<void> call({
    required int contractId,
  }) async {
    try {
      final dio = Dio();
      dio.options.headers["X-Custom-Api-Key"] =
          "Token fc3b4ca30130eb7bd06b534e164f93b611b9caad";
      dio.options.headers["Authorization"] =
          "Token c683306d16bf3b9c9aa6b6b360355028b3803bc2";
      dio.options.headers["Content-Type"] = "application/json";
      await dio.post(
        'https://api-mobile.ecorp-isp.com.br/recursos/assinar_contrato',
        data: {
          "codigo_contrato": contractId,
        },
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
