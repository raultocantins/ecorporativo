import 'package:dartz/dartz.dart';
import 'package:ecorporativo/src/features/home/domain/entities/helpdesk_list_entity.dart';
import '../repositories/get_helpdesk_repository.dart';

abstract class GetHelpDesk {
  Future<Either<String, HelpDeskListEntity>> call({
    required int userId,
  });
}

class GetHelpDeskImpl implements GetHelpDesk {
  final GetHelpDeskRepository getHelpDeskRepository;

  GetHelpDeskImpl({required this.getHelpDeskRepository});

  @override
  Future<Either<String, HelpDeskListEntity>> call({
    required int userId,
  }) async {
    return await getHelpDeskRepository(userId: userId);
  }
}
