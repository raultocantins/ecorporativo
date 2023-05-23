import 'package:dartz/dartz.dart';
import 'package:ecorporativo/src/features/home/domain/entities/contract_items_entity.dart';

abstract class GetContractItemsRepository {
  Future<Either<String, ContractItemsEntity>> call({
    required int contractId,
  });
}
