import 'package:ecorporativo/src/features/home/data/models/contract_items_model.dart';

abstract class GetContractItemsDatasource {
  Future<ContractItemsModel> call({
    required int contractId,
  });
}
