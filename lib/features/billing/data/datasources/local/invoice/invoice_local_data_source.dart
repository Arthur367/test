import 'package:injectable/injectable.dart';
import 'package:mobile_pos/core/error/exceptions.dart';
import 'package:mobile_pos/database/invoice/invoice_dao.dart';
import 'package:mobile_pos/database/transaction/transaction_details.dart';
import 'package:mobile_pos/features/billing/data/models/invoice/invoice_model.dart';
import 'package:mobile_pos/features/billing/domain/entities/invoice_entity.dart';

abstract class InvoiceLocalDataSource {
  Future<List<InvoiceModel>> retrieveInvoices();
  Future<void> retrieveInvoice(InvoiceEntity invoice);
  Future<List<TransactionDetails>> getTransactionDetails();
}

@LazySingleton(as: InvoiceLocalDataSource)
class InvoiceLocalDataSourceImp implements InvoiceLocalDataSource {
  final InvoiceDao _invoiceDao;
  InvoiceLocalDataSourceImp(this._invoiceDao);

  @override
  Future<void> retrieveInvoice(InvoiceEntity invoice) async {
    // TODO: implement retrieveInvoice
    try {
      await _invoiceDao.getInvoice(invoice.invoicenumber);
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<List<InvoiceModel>> retrieveInvoices() async {
    // TODO: implement retrieveInvoices
    try {
      var _invoices = await _invoiceDao.getInvoices();
      return _invoices
          .map(
            (e) => InvoiceModel(
                id: e.id,
                invoicenumber: e.invoicenumber,
                total: e.total,
                tax: e.tax,
                subtotal: e.subtotal,
                customerId: e.customerId,
                productId: e.productId,
                price: e.price,
                invoiceId: e.invoiceId,
                productCode: e.productCode,
                createdAt: e.createdAt),
          )
          .toList();
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<List<TransactionDetails>> getTransactionDetails() {
    // TODO: implement getTransactionDetails
    throw UnimplementedError();
  }
}
