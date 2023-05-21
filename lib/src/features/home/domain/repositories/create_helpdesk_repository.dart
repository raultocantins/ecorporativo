import 'package:dartz/dartz.dart';

abstract class CreateHelpDeskRepository {
  Future<Either<String, void>> call(
      {required int contractId,
      required int contractItem,
      required int service,
      required int prognostic,
      required int userId});
}
