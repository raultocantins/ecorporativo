import 'package:dartz/dartz.dart';

abstract class SignContractRepository {
  Future<Either<String, void>> call({
    required int contractId,
  });
}
