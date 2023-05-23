import 'package:ecorporativo/src/features/authentication/domain/entities/user_entity.dart';
import 'package:ecorporativo/src/features/home/domain/entities/invoice_entity.dart';
import 'package:ecorporativo/src/features/home/domain/entities/invoices_entity.dart';
import 'package:ecorporativo/src/features/home/domain/usecases/get_invoices_usecase.dart';
import 'package:ecorporativo/src/features/home/domain/usecases/trust_release_usecase.dart';
import 'package:ecorporativo/src/shared/utils/date_format.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/config/navigation.dart';
import '../../../../shared/utils/alerts.dart';

part 'invoices_controller.g.dart';

// ignore: library_private_types_in_public_api
class InvoicesController = _InvoicesControllerBase with _$InvoicesController;

abstract class _InvoicesControllerBase with Store {
  GetInvoices getInvoices;
  TrustRelease trustRelease;
  _InvoicesControllerBase(
      {required this.getInvoices, required this.trustRelease});

  @observable
  bool isLoading = false;

  @observable
  int? contractId;

  @observable
  InvoicesEntity? invoices;

  @observable
  InvoicesEntity? moreInvoices;

  @observable
  UserEntity? user;

  @action
  changeIsLoading(bool value) {
    isLoading = value;
  }

  @action
  changeInvoices(InvoicesEntity value) {
    invoices = value;
  }

  @action
  changeMoreInvoices(InvoicesEntity value) {
    moreInvoices = value;
  }

  @action
  changeUser(UserEntity value) {
    user = value;
  }

  @action
  changeContractId(int value) {
    contractId = value;
    fetchInvoices();
  }

  fetchInvoices() async {
    changeIsLoading(true);
    clearInvoices();

    var result = await getInvoices(contractId: contractId!);
    result.fold(
        (l) => AlertsCustom.error(NavigationCustom.currentState.context,
            title: l,
            message:
                "Por algum motivo não conseguimos concluir sua solicitação!"),
        (r) {
      if (r.invoices.length > 3) {
        List<InvoiceEntity> newlist = r.invoices.sublist(3, r.invoices.length);
        changeMoreInvoices(InvoicesEntity(invoices: newlist));
        changeInvoices(r);
      } else {
        changeInvoices(r);
      }
    });
    changeIsLoading(false);
  }

  trustReleaseContract(
    BuildContext context, {
    required int codigoFinanceiro,
  }) async {
    changeIsLoading(true);
    final result = await trustRelease(
        contractId: contractId!,
        user: user!,
        codigoFinanceiro: codigoFinanceiro);
    result.fold(
        (l) => AlertsCustom.error(NavigationCustom.currentState.context,
            title: l,
            message:
                "Por algum motivo não conseguimos concluir sua solicitação!"),
        (r) {
      fetchInvoices();
      AlertsCustom.success(context,
          title: "Contrato desbloqueado",
          message: "liberação de confiança efetuada com sucesso.");
    });
    changeIsLoading(false);
  }

  clearInvoices() {
    invoices = null;
    moreInvoices = null;
  }

  String getDate(DateTime? date) {
    return "Vencimento ${DateUtils.formatterDate(date ?? DateTime.now())}";
  }

  String getMonth(DateTime? date) {
    return DateUtils.formatterDateMonth(date ?? DateTime.now());
  }

  String formatPrice(double? value) {
    return value.toString();
  }

  @action
  dispose() {
    isLoading = false;
    invoices = null;
    moreInvoices = null;
    contractId = null;
  }
}
