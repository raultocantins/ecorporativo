import 'package:dio/dio.dart';
import 'package:ecorporativo/src/features/home/data/datasources/get_contracts_datasource.dart';
import 'package:ecorporativo/src/features/home/data/models/invoices_model.dart';

class GetInvoicesDatasourceImpl implements GetInvoicesDatasource {
  @override
  Future<InvoicesModel> call({
    required int contractId,
  }) async {
    try {
      final dio = Dio();
      dio.options.headers["X-Custom-Api-Key"] =
          "Token fc3b4ca30130eb7bd06b534e164f93b611b9caad";
      dio.options.headers["Authorization"] =
          "Token c683306d16bf3b9c9aa6b6b360355028b3803bc2";
      dio.options.headers["Content-Type"] = "application/json";
      final response = await dio.post(
        'https://api-mobile.ecorp-isp.com.br/recursos/consultaFinanceiro/',
        data: {
          "codigo_contrato": contractId,
        },
      );
      return InvoicesModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
