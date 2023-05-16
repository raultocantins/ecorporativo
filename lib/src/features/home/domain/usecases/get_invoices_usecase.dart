import 'package:dartz/dartz.dart';
import 'package:ecorporativo/src/features/home/domain/entities/invoices_entity.dart';
import 'package:ecorporativo/src/features/home/domain/repositories/get_invoices_repository.dart';

abstract class GetInvoices {
  Future<Either<String, InvoicesEntity>> call({
    required int contractId,
  });
}

class GetInvoicesImpl implements GetInvoices {
  final GetInvoicesRepository getInvoicesRepository;

  GetInvoicesImpl({required this.getInvoicesRepository});

  @override
  Future<Either<String, InvoicesEntity>> call({
    required int contractId,
  }) async {
    return await getInvoicesRepository(contractId: contractId);
  }
}
