import '../../../authentication/domain/entities/user_entity.dart';

abstract class TrustReleaseDatasource {
  Future<void> call({
    required int contractId,
    required int codigoFinanceiro,
    required UserEntity user,
  });
}
