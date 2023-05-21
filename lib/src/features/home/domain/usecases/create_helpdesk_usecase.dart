import 'package:dartz/dartz.dart';

import '../repositories/create_helpdesk_repository.dart';

abstract class CreateHelpDesk {
  Future<Either<String, void>> call(
      {required int contractId,
      required int contractItem,
      required int service,
      required int prognostic,
      required int userId});
}

class CreateHelpDeskImpl implements CreateHelpDesk {
  final CreateHelpDeskRepository createHelpDeskRepository;

  CreateHelpDeskImpl({required this.createHelpDeskRepository});

  @override
  Future<Either<String, void>> call(
      {required int contractId,
      required int contractItem,
      required int service,
      required int prognostic,
      required int userId}) async {
    return await createHelpDeskRepository(
        contractId: contractId,
        contractItem: contractItem,
        prognostic: prognostic,
        service: service,
        userId: userId);
  }
}
