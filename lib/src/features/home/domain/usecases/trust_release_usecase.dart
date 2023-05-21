import 'package:dartz/dartz.dart';

import '../../../authentication/domain/entities/user_entity.dart';
import '../repositories/trust_release_repository.dart';

abstract class TrustRelease {
  Future<Either<String, void>> call({
    required int contractId,
    required UserEntity user,
  });
}

class TrustReleaseImpl implements TrustRelease {
  final TrustReleaseRepository trustReleaseRepository;

  TrustReleaseImpl({required this.trustReleaseRepository});

  @override
  Future<Either<String, void>> call({
    required int contractId,
    required UserEntity user,
  }) async {
    return await trustReleaseRepository(contractId: contractId, user: user);
  }
}
