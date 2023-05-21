import 'package:ecorporativo/src/features/authentication/data/datasources/get_contracts_datasource.dart';
import 'package:ecorporativo/src/features/authentication/data/models/contracts_model.dart';

import '../../../shared/utils/dio.dart';

class GetContractsDatasourceImpl implements GetContractsDatasource {
  @override
  Future<ContractsModel> call({
    required int userid,
  }) async {
    try {
      final response = await HttpService().dio.post(
        'recursos/consultaContratos/',
        data: {
          "codigo_cliente": userid,
        },
      );
      return ContractsModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
