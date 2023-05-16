import 'package:dartz/dartz.dart';
import 'package:ecorporativo/src/features/home/data/models/invoices_model.dart';
import 'package:ecorporativo/src/features/home/domain/entities/invoices_entity.dart';
import 'package:ecorporativo/src/features/home/domain/repositories/get_invoices_repository.dart';
import '../datasources/get_invoices_datasource.dart';

class GetInvoicesRepositoryImpl implements GetInvoicesRepository {
  final GetInvoicesDatasource getInvoicesDatasource;

  GetInvoicesRepositoryImpl({required this.getInvoicesDatasource});
  @override
  Future<Either<String, InvoicesEntity>> call({
    required int contractId,
  }) async {
    try {
      final result = await getInvoicesDatasource(contractId: contractId);
      InvoicesEntity contractsEntity = InvoicesModel.toEntity(result);
      return Right(contractsEntity);
    } catch (e) {
      return const Left("Aconteceu um erro inesperado");
    }
  }
}
