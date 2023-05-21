import 'package:dartz/dartz.dart';
import 'package:ecorporativo/src/features/home/domain/repositories/trust_release_repository.dart';

import '../../../authentication/domain/entities/user_entity.dart';
import '../datasources/trust_release_datasource.dart';

class TrustReleaseRepositoryImpl implements TrustReleaseRepository {
  final TrustReleaseDatasource trustReleaseDatasource;

  TrustReleaseRepositoryImpl({required this.trustReleaseDatasource});
  @override
  Future<Either<String, void>> call({
    required int contractId,
    required UserEntity user,
  }) async {
    try {
      return Right(
          await trustReleaseDatasource(contractId: contractId, user: user));
    } catch (e) {
      return const Left("Aconteceu um erro inesperado");
    }
  }
}
