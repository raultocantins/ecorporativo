import 'package:ecorporativo/src/features/home/data/models/invoices_model.dart';

abstract class GetInvoicesDatasource {
  Future<InvoicesModel> call({
    required int contractId,
  });
}
