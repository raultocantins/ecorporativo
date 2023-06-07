import 'package:ecorporativo/src/features/home/domain/entities/contract_items_entity.dart';
import 'package:ecorporativo/src/features/home/domain/entities/helpdesk_list_entity.dart';
import 'package:ecorporativo/src/features/home/domain/usecases/create_helpdesk_usecase.dart';
import 'package:ecorporativo/src/features/home/domain/usecases/get_contract_items_usecase.dart';
import 'package:ecorporativo/src/features/home/domain/usecases/get_helpdesk_usecase.dart';
import 'package:ecorporativo/src/shared/config/navigation.dart';
import 'package:ecorporativo/src/shared/utils/alerts.dart';
import 'package:mobx/mobx.dart';
import '../../domain/entities/helpdesk_entity.dart';

part 'support_controller.g.dart';

// ignore: library_private_types_in_public_api
class SupportController = _SupportControllerBase with _$SupportController;

abstract class _SupportControllerBase with Store {
  GetHelpDesk getHelpDeskUsecase;
  CreateHelpDesk createHelpDeskUsecase;
  GetContractItems getContractItems;
  _SupportControllerBase(
      {required this.getHelpDeskUsecase,
      required this.createHelpDeskUsecase,
      required this.getContractItems});

  @observable
  bool isLoading = false;

  @observable
  int? userId;

  @observable
  ContractItemsEntity? itemsContract;

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
            .where((e) => e.status.code == "2" || e.status.code == "1")
            .toList()
            .reversed
            .toList() ??
        [];
  }

  @action
  changeIsLoading(bool value) {
    isLoading = value;
  }

  @action
  changeHelpDesk(HelpDeskListEntity value) {
    helpDeskListEntity = value;
  }

  @action
  changeUserId(int value) {
    userId = value;
  }

  @action
  changeItemsContract(ContractItemsEntity? value) {
    itemsContract = value;
  }

  getHelpDesk() async {
    changeIsLoading(true);
    final result = await getHelpDeskUsecase(userId: userId!);
    result.fold(
        (l) => AlertsCustom.error(NavigationCustom.currentState.context,
            title: l,
            message:
                "Por algum motivo não conseguimos concluir sua solicitação!"),
        (r) => changeHelpDesk(r));
    changeIsLoading(false);
  }

  createHelpDesk({
    required int contractId,
    required int contractItem,
    required int service,
    required int prognostic,
  }) async {
    final result = await createHelpDeskUsecase(
        contractId: contractId,
        contractItem: contractItem,
        service: service,
        prognostic: prognostic,
        userId: userId!);
    result.fold(
        (l) => AlertsCustom.error(NavigationCustom.currentState.context,
            title: l,
            message:
                "Por algum motivo não conseguimos concluir sua solicitação!"),
        (r) => getHelpDesk());
  }

  getItemsContract(int contractId) async {
    changeItemsContract(null);
    final result = await getContractItems(contractId: contractId);
    result.fold(
        (l) => AlertsCustom.error(NavigationCustom.currentState.context,
            title: l,
            message:
                "Por algum motivo não conseguimos concluir sua solicitação!"),
        (r) {
      changeItemsContract(r);
    });
  }

  @action
  dispose() {
    isLoading = false;
    helpDeskListEntity = null;
    userId = null;
    itemsContract = null;
  }
}
