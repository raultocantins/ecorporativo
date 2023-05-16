import 'package:dartz/dartz.dart';
import 'package:ecorporativo/src/features/authentication/domain/entities/contracts_entity.dart';

abstract class GetContractsRepository {
  Future<Either<String, ContractsEntity>> call({
    required int userid,
  });
}
