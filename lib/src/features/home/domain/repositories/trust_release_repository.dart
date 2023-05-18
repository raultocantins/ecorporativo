import 'package:dartz/dartz.dart';

abstract class TrustReleaseRepository {
  Future<Either<String, void>> call({
    required int contractId,
  });
}
