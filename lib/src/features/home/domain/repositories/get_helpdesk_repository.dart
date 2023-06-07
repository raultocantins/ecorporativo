import 'package:dartz/dartz.dart';
import 'package:ecorporativo/src/features/home/domain/entities/helpdesk_list_entity.dart';

abstract class GetHelpDeskRepository {
  Future<Either<String, HelpDeskListEntity>> call(
      {required int userId, String? helpDeskId});
}
