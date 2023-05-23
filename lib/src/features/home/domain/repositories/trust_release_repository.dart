import 'package:dartz/dartz.dart';

import '../../../authentication/domain/entities/user_entity.dart';

abstract class TrustReleaseRepository {
  Future<Either<String, void>> call({
    required int contractId,
    required int codigoFinanceiro,
    required UserEntity user,
  });
}
