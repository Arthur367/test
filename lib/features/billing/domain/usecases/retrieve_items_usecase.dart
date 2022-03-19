import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/features/billing/data/models/invoice/invoice_model.dart';
import 'package:mobile_pos/features/billing/data/models/transactions/transactions_model.dart';
import 'package:mobile_pos/features/billing/domain/entities/invoice_entity.dart';
import 'package:mobile_pos/features/billing/domain/entities/transactions_entity.dart';
import 'package:mobile_pos/features/billing/domain/repositories/invoice_repository.dart';
import 'package:mobile_pos/features/billing/domain/repositories/transaction_repository.dart';
import 'package:mobile_pos/core/usecases/usecase.dart' as usecase;
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/billing_item_entity.dart';
import '../repositories/billing_items_repository.dart';

@lazySingleton
class RetriveItemsUseCase
    implements UseCase<List<BillingItemEntity>, NoParams> {
  final BillingItemsRepository _billingItemsRepository;

  const RetriveItemsUseCase(
    this._billingItemsRepository,
  );

  @override
  Future<Either<Failure, List<BillingItemEntity>>> call(NoParams params) async {
    return await _billingItemsRepository.retrieveItems();
  }
}

class RetrieveInvoicesUseCase
    implements UseCase<List<InvoiceEntity>, NoParams> {
  final InvoiceRepository _invoicesRepository;
  const RetrieveInvoicesUseCase(this._invoicesRepository);

  @override
  Future<Either<Failure, List<InvoiceEntity>>> call(NoParams params) async {
    // TODO: implement call
    return await _invoicesRepository.retrieveInvoices();
  }
}

class RetrieveInvoiceUseCase implements usecase.UseCase<void, ItemParame> {
  final InvoiceRepository _invoiceRepository;
  const RetrieveInvoiceUseCase(this._invoiceRepository);

  @override
  Future<Either<Failure, void>> call(ItemParame params) async {
    // TODO: implement call
    return await _invoiceRepository.retrieveInvoice(params.invoice);
  }
}

class ItemParame extends Equatable {
  final InvoiceEntity invoice;

  const ItemParame({required this.invoice});

  @override
  List<Object?> get props => [invoice];
}
