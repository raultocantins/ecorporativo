import 'package:dartz/dartz.dart';

import '../repositories/trust_release_repository.dart';

abstract class TrustRelease {
  Future<Either<String, void>> call({
    required int contractId,
  });
}

class TrustReleaseImpl implements TrustRelease {
  final TrustReleaseRepository trustReleaseRepository;

  TrustReleaseImpl({required this.trustReleaseRepository});

  @override
  Future<Either<String, void>> call({
    required int contractId,
  }) async {
    return await trustReleaseRepository(contractId: contractId);
  }
}
