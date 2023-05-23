import 'package:dartz/dartz.dart';
import 'package:ecorporativo/src/features/home/domain/entities/contract_items_entity.dart';

import '../repositories/get_contract_items_repository.dart';

abstract class GetContractItems {
  Future<Either<String, ContractItemsEntity>> call({
    required int contractId,
  });
}

class GetContractItemsImpl implements GetContractItems {
  final GetContractItemsRepository getContractItemsRepository;

  GetContractItemsImpl({required this.getContractItemsRepository});

  @override
  Future<Either<String, ContractItemsEntity>> call({
    required int contractId,
  }) async {
    return await getContractItemsRepository(contractId: contractId);
  }
}
