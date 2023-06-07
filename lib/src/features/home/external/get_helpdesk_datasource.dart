import 'package:ecorporativo/src/features/home/data/models/helpdesk_list_model.dart';
import '../../../shared/utils/dio.dart';
import '../data/datasources/get_helpdesk_datasource.dart';

class GetHelpDeskDatasourceImpl implements GetHelpDeskDatasource {
  @override
  Future<HelpDeskListModel> call(
      {required int userId, String? helpDeskId}) async {
    try {
      final response = await HttpService().dio.get(
        'recursos/consultaHelpDesk/',
        data: {
          "codigo_cliente": userId,
          "codigo_helpdesk": helpDeskId,
          "chave": HttpService().chave
        },
      );
      return HelpDeskListModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
