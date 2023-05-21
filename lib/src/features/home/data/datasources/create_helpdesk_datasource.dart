abstract class CreateHelpDeskDatasource {
  Future<void> call(
      {required int contractId,
      required int contractItem,
      required int service,
      required int prognostic,
      required int userId});
}
