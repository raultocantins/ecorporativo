import '../../../shared/utils/dio.dart';
import '../data/datasources/sign_contract_datasource.dart';

class SignContractDatasourceImpl implements SignContractDatasource {
  @override
  Future<void> call({
    required int contractId,
  }) async {
    try {
      await HttpService().dio.post(
        'recursos/assinarContrato/',
        data: {
          "codigo_contrato": contractId,
        },
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
