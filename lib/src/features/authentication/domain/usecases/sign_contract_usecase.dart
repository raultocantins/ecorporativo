import 'package:dartz/dartz.dart';
import '../repositories/sign_contract_repository.dart';

abstract class SignContract {
  Future<Either<String, void>> call({
    required int contractId,
  });
}

class SignContractImpl implements SignContract {
  final SignContractRepository signContractRepository;

  SignContractImpl({required this.signContractRepository});

  @override
  Future<Either<String, void>> call({
    required int contractId,
  }) async {
    return await signContractRepository(contractId: contractId);
  }
}
