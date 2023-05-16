import 'package:ecorporativo/src/features/authentication/data/models/contracts_model.dart';

abstract class GetContractsDatasource {
  Future<ContractsModel> call({
    required int userid,
  });
}
