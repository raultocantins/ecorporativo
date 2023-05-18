import 'package:ecorporativo/src/features/home/domain/entities/helpdesk_list_entity.dart';
import 'package:ecorporativo/src/features/home/domain/usecases/get_helpdesk_usecase.dart';
import 'package:mobx/mobx.dart';
import '../../domain/entities/helpdesk_entity.dart';

part 'support_controller.g.dart';

// ignore: library_private_types_in_public_api
class SupportController = _SupportControllerBase with _$SupportController;

abstract class _SupportControllerBase with Store {
  GetHelpDesk getHelpDeskUsecase;
  _SupportControllerBase({required this.getHelpDeskUsecase});

  @observable
  bool isLoading = false;

  @observable
  int? userId;

  @observable
  int? contractId;

  @observable
  HelpDeskListEntity? helpDeskListEntity;

  List<HelpDeskEntity> get helpDeskListOpened {
    return helpDeskListEntity?.called
            .where((e) => e.status.code == "0")
            .toList() ??
        [];
  }

  List<HelpDeskEntity> get helpDeskListFinalized {
    return helpDeskListEntity?.called
            .where((e) => e.status.code == "2")
            .toList() ??
        [];
  }

  @action
  changeIsLoading(bool value) {
    isLoading = value;
  }

  @action
  changeContractId(int value) {
    contractId = value;
  }

  @action
  changeHelpDesk(HelpDeskListEntity value) {
    helpDeskListEntity = value;
  }

  @action
  changeUserId(int value) {
    userId = value;
  }

  getHelpDesk(int? userId) async {
    changeIsLoading(true);
    final result = await getHelpDeskUsecase(userId: userId ?? 0);
    result.fold((l) => null, (r) => changeHelpDesk(r));
    changeIsLoading(false);
  }

  @action
  dispose() {
    isLoading = false;
    helpDeskListEntity = null;
    userId = null;
  }
}
