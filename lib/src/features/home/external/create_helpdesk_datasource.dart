import '../../../shared/utils/dio.dart';
import '../data/datasources/create_helpdesk_datasource.dart';

class CreateHelpDeskDatasourceImpl implements CreateHelpDeskDatasource {
  @override
  Future<void> call(
      {required int contractId,
      required int contractItem,
      required int service,
      required int prognostic,
      required int userId}) async {
    try {
      await HttpService().dio.post(
        'recursos/registroHelpDesk/',
        data: {
          "codigo_contrato": contractId,
          "codigo_contrato_item": contractItem,
          "codigo_cliente": userId,
          "tipo_demanda": 4,
          "codigo_servico": service,
          "codigo_sintoma": prognostic
        },
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
