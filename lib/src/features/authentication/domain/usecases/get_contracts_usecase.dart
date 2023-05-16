import 'package:dartz/dartz.dart';
import 'package:ecorporativo/src/features/authentication/domain/entities/contracts_entity.dart';

import '../repositories/get_contracts_repository.dart';

abstract class GetContracts {
  Future<Either<String, ContractsEntity>> call({
    required int userid,
  });
}

class GetContractsImpl implements GetContracts {
  final GetContractsRepository getContractsRepository;

  GetContractsImpl({required this.getContractsRepository});

  @override
  Future<Either<String, ContractsEntity>> call({
    required int userid,
  }) async {
    return await getContractsRepository(userid: userid);
  }
}
