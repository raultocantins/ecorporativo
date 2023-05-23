import 'package:dartz/dartz.dart';
import 'package:ecorporativo/src/features/home/data/datasources/get_contract_items_datasource.dart';
import 'package:ecorporativo/src/features/home/data/models/contract_items_model.dart';
import 'package:ecorporativo/src/features/home/domain/entities/contract_items_entity.dart';

import '../../domain/repositories/get_contract_items_repository.dart';

class GetContractItemsRepositoryImpl implements GetContractItemsRepository {
  final GetContractItemsDatasource getContractItemsDatasource;

  GetContractItemsRepositoryImpl({required this.getContractItemsDatasource});
  @override
  Future<Either<String, ContractItemsEntity>> call({
    required int contractId,
  }) async {
    try {
      final result = await getContractItemsDatasource(contractId: contractId);
      ContractItemsEntity contractsEntity = ContractItemsModel.toEntity(result);
      return Right(contractsEntity);
    } catch (e) {
      return const Left("Aconteceu um erro inesperado");
    }
  }
}
