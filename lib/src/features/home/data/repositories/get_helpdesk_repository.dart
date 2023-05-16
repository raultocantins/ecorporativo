import 'package:dartz/dartz.dart';
import 'package:ecorporativo/src/features/home/data/models/helpdesk_list_model.dart';
import 'package:ecorporativo/src/features/home/domain/entities/helpdesk_list_entity.dart';
import '../../domain/repositories/get_helpdesk_repository.dart';
import '../datasources/get_helpdesk_datasource.dart';

class GetHelpDeskRepositoryImpl implements GetHelpDeskRepository {
  final GetHelpDeskDatasource getHelpDeskDatasource;

  GetHelpDeskRepositoryImpl({required this.getHelpDeskDatasource});
  @override
  Future<Either<String, HelpDeskListEntity>> call({
    required int userId,
  }) async {
    try {
      final result = await getHelpDeskDatasource(userId: userId);
      HelpDeskListEntity contractsEntity = HelpDeskListModel.toEntity(result);
      return Right(contractsEntity);
    } catch (e) {
      return const Left("Aconteceu um erro inesperado");
    }
  }
}
