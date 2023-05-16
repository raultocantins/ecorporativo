import 'package:dartz/dartz.dart';
import 'package:ecorporativo/src/features/authentication/domain/repositories/sign_contract_repository.dart';
import '../datasources/sign_contract_datasource.dart';

class SignContractRepositoryImpl implements SignContractRepository {
  final SignContractDatasource signContractDatasource;

  SignContractRepositoryImpl({required this.signContractDatasource});
  @override
  Future<Either<String, void>> call({
    required int contractId,
  }) async {
    try {
      final result = await signContractDatasource(contractId: contractId);
      return Right(result);
    } catch (e) {
      return const Left("Aconteceu um erro inesperado");
    }
  }
}
