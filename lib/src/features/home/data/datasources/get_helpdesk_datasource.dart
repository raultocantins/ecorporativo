import 'package:ecorporativo/src/features/home/data/models/helpdesk_list_model.dart';

abstract class GetHelpDeskDatasource {
  Future<HelpDeskListModel> call({
    required int userId,
  });
}
