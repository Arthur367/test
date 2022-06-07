import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/core/error/failures.dart';
import 'package:mobile_pos/features/billing/data/datasources/local/invoice/invoice_local_data_source.dart';
import 'package:mobile_pos/features/billing/domain/entities/invoice_entity.dart';
import 'package:mobile_pos/features/billing/domain/repositories/invoice_repository.dart';

@LazySingleton(as: InvoiceRepository)
class InvoiceRepositoryImpl implements InvoiceRepository {
  final InvoiceLocalDataSource _invoiceLocalDataSource;

  const InvoiceRepositoryImpl(this._invoiceLocalDataSource);

  @override
  Future<Either<Failure, void>> retrieveInvoice(InvoiceEntity invoice) async {
    // TODO: implement retrieveInvoice
    try {
      return Right(await _invoiceLocalDataSource.retrieveInvoice(invoice));
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<InvoiceEntity>>> retrieveInvoices() async {
    // TODO: implement retrieveInvoices
    try {
      return Right(await _invoiceLocalDataSource.retrieveInvoices());
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }
}
