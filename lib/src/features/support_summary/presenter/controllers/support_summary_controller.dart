import 'package:ecorporativo/src/features/home/domain/entities/helpdesk_entity.dart';
import 'package:ecorporativo/src/features/home/domain/entities/helpdesk_list_entity.dart';
import 'package:ecorporativo/src/features/home/domain/usecases/get_helpdesk_usecase.dart';
import 'package:ecorporativo/src/shared/config/navigation.dart';
import 'package:ecorporativo/src/shared/utils/alerts.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'support_summary_controller.g.dart';

// ignore: library_private_types_in_public_api
class SupportSummaryController = _SupportSummaryControllerBase
    with _$SupportSummaryController;

abstract class _SupportSummaryControllerBase with Store {
  GetHelpDesk getHelpDeskUsecase;

  _SupportSummaryControllerBase({
    required this.getHelpDeskUsecase,
  });

  @observable
  bool isLoading = true;

  @observable
  int? userId;

  @observable
  String? helpDeskId;

  @observable
  HelpDeskListEntity? helpDeskListEntity;

  @computed
  HelpDeskEntity? get called => HelpDeskEntity(
      dates: helpDeskListEntity!.called.first.dates,
      id: helpDeskListEntity!.called.first.id,
      prognostic: helpDeskListEntity!.called.first.prognostic,
      status: helpDeskListEntity!.called.first.status,
      historicList:
          helpDeskListEntity?.called.first.historicList?.reversed.toList());

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
  changeHelpDeskId(String value) {
    helpDeskId = value;
  }

  getHelpDesk(context) async {
    changeIsLoading(true);
    final result =
        await getHelpDeskUsecase(userId: userId!, helpDeskId: helpDeskId);
    result.fold((l) {
      AlertsCustom.error(NavigationCustom.currentState.context,
          title: l,
          message:
              "Por algum motivo não conseguimos concluir sua solicitação!");
      Navigator.of(context).pop();
    }, (r) {
      if (r.called.first.status.code == '0' ||
          r.called.first.status.code == '1') {
        updateHelpDesk(context);
      }
      changeHelpDesk(r);
    });
    changeIsLoading(false);
  }

  updateHelpDesk(context) async {
    await Future.delayed(const Duration(seconds: 10));
    final result =
        await getHelpDeskUsecase(userId: userId!, helpDeskId: helpDeskId);
    result.fold((l) {
      AlertsCustom.error(NavigationCustom.currentState.context,
          title: l,
          message:
              "Por algum motivo não conseguimos concluir sua solicitação!");
      Navigator.of(context).pop();
    }, (r) {
      if (r.called.first.status.code == '0' ||
          r.called.first.status.code == '1') {
        updateHelpDesk(context);
      }
      changeHelpDesk(r);
    });
  }

  @action
  dispose() {
    isLoading = true;
    helpDeskListEntity = null;
    userId = null;
    helpDeskId = null;
  }
}
