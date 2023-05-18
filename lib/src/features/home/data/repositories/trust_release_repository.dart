import 'package:dartz/dartz.dart';
import 'package:ecorporativo/src/features/home/domain/repositories/trust_release_repository.dart';

import '../datasources/trust_release_datasource.dart';

class TrustReleaseRepositoryImpl implements TrustReleaseRepository {
  final TrustReleaseDatasource trustReleaseDatasource;

  TrustReleaseRepositoryImpl({required this.trustReleaseDatasource});
  @override
  Future<Either<String, void>> call({
    required int contractId,
  }) async {
    try {
      return Right(await trustReleaseDatasource(contractId: contractId));
    } catch (e) {
      return const Left("Aconteceu um erro inesperado");
    }
  }
}
