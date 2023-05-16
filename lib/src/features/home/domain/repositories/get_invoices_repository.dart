import 'package:dartz/dartz.dart';
import 'package:ecorporativo/src/features/home/domain/entities/invoices_entity.dart';

abstract class GetInvoicesRepository {
  Future<Either<String, InvoicesEntity>> call({
    required int contractId,
  });
}
