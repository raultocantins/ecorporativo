import 'package:dartz/dartz.dart';
import 'package:ecorporativo/src/features/authentication/data/models/contracts_model.dart';
import 'package:ecorporativo/src/features/authentication/domain/entities/contracts_entity.dart';
import 'package:ecorporativo/src/features/authentication/domain/repositories/get_contracts_repository.dart';
import '../datasources/get_contracts_datasource.dart';

class GetContractsRepositoryImpl implements GetContractsRepository {
  final GetContractsDatasource getContractsDatasource;

  GetContractsRepositoryImpl({required this.getContractsDatasource});
  @override
  Future<Either<String, ContractsEntity>> call({
    required int userid,
  }) async {
    try {
      final result = await getContractsDatasource(userid: userid);
      ContractsEntity contractsEntity = ContractsModel.toEntity(result);
      return Right(contractsEntity);
    } catch (e) {
      return const Left("Aconteceu um erro inesperado");
    }
  }
}
