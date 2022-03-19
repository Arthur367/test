import 'package:dartz/dartz.dart';
import 'package:mobile_pos/core/error/failures.dart';
import 'package:mobile_pos/features/billing/domain/entities/invoice_entity.dart';

abstract class InvoiceRepository {
  Future<Either<Failure, List<InvoiceEntity>>> retrieveInvoices();
  Future<Either<Failure, void>> retrieveInvoice(InvoiceEntity invoice);
}
