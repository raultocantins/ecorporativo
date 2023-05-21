import 'package:ecorporativo/src/features/home/data/models/invoices_model.dart';

import '../../../shared/utils/dio.dart';
import '../data/datasources/get_invoices_datasource.dart';

class GetInvoicesDatasourceImpl implements GetInvoicesDatasource {
  @override
  Future<InvoicesModel> call({
    required int contractId,
  }) async {
    try {
      final response = await HttpService().dio.post(
        'recursos/consultaFinanceiro/',
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
