import 'package:ecorporativo/src/features/home/domain/entities/invoice_entity.dart';
import 'package:ecorporativo/src/features/home/domain/entities/invoices_entity.dart';
import 'package:ecorporativo/src/features/home/domain/usecases/get_invoices_usecase.dart';
import 'package:ecorporativo/src/shared/utils/date_format.dart';
import 'package:mobx/mobx.dart';

part 'invoices_controller.g.dart';

// ignore: library_private_types_in_public_api
class InvoicesController = _InvoicesControllerBase with _$InvoicesController;

abstract class _InvoicesControllerBase with Store {
  GetInvoices getInvoices;
  _InvoicesControllerBase({required this.getInvoices});

  @observable
  bool isLoading = false;

  @observable
  int? contractId;

  @observable
  InvoicesEntity? invoices;

  @observable
  InvoicesEntity? moreInvoices;

  List<InvoiceEntity>? get invoicesOpening {
    return invoices?.invoices
            .where((element) => element.situacao == "Aberto")
            .toList() ??
        [];
  }

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
  changeContractId(int value) {
    contractId = value;
    fetchInvoices();
  }

  fetchInvoices() async {
    changeIsLoading(true);
    var result = await getInvoices(contractId: contractId ?? 0);
    result.fold((l) => null, (r) {
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
