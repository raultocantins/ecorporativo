import 'package:ecorporativo/src/features/authentication/domain/entities/user_entity.dart';
import '../../../shared/utils/dio.dart';
import '../data/datasources/trust_release_datasource.dart';

import 'package:intl/intl.dart';

class TrustReleaseDatasourceImpl implements TrustReleaseDatasource {
  @override
  Future<void> call({
    required int contractId,
    required int codigoFinanceiro,
    required UserEntity user,
  }) async {
    try {
      await HttpService().dio.post(
        'recursos/informePagamento/',
        data: {
          // "codigo_contrato": contractId,
          "data_pagamento": DateFormat("yyyy-MM-dd", "pt_BR")
              .format(DateTime.now().toLocal()),
          "cpf_cnpj": user.documento,
          "codigo_financeiro": codigoFinanceiro,
          // "codigo_cliente": user.id
        },
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
