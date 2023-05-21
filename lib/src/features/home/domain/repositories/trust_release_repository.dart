import 'package:dartz/dartz.dart';

import '../../../authentication/domain/entities/user_entity.dart';

abstract class TrustReleaseRepository {
  Future<Either<String, void>> call({
    required int contractId,
    required UserEntity user,
  });
}
