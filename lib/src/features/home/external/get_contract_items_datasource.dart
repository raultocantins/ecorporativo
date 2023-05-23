import 'package:ecorporativo/src/features/home/data/datasources/get_contract_items_datasource.dart';
import 'package:ecorporativo/src/features/home/data/models/contract_items_model.dart';

import '../../../shared/utils/dio.dart';

class GetContractItemsDatasourceImpl implements GetContractItemsDatasource {
  @override
  Future<ContractItemsModel> call({
    required int contractId,
  }) async {
    try {
      final response = await HttpService().dio.post(
        'recursos/consultaItensContrato/',
        data: {
          "codigo_contrato": [contractId],
        },
      );
      return ContractItemsModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
