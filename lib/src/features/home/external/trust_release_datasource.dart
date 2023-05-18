import 'package:dio/dio.dart';
import '../data/datasources/trust_release_datasource.dart';

import 'package:intl/intl.dart';

class TrustReleaseDatasourceImpl implements TrustReleaseDatasource {
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
        'https://api-mobile.ecorp-isp.com.br/recursos/informePagamento/',
        data: {
          "codigo_contrato": contractId,
          "data_pagamento":
              DateFormat("yyyy/MM/DD", "pt_BR").format(DateTime.now().toLocal())
        },
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
