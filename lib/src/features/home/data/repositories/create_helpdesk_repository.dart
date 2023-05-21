import 'package:dartz/dartz.dart';

import '../../domain/repositories/create_helpdesk_repository.dart';
import '../datasources/create_helpdesk_datasource.dart';

class CreateHelpDeskRepositoryImpl implements CreateHelpDeskRepository {
  final CreateHelpDeskDatasource createHelpDeskDatasource;

  CreateHelpDeskRepositoryImpl({required this.createHelpDeskDatasource});
  @override
  Future<Either<String, void>> call(
      {required int contractId,
      required int contractItem,
      required int service,
      required int prognostic,
      required int userId}) async {
    try {
      return Right(await createHelpDeskDatasource(
          contractId: contractId,
          contractItem: contractItem,
          prognostic: prognostic,
          service: service,
          userId: userId));
    } catch (e) {
      return const Left("Aconteceu um erro inesperado");
    }
  }
}
