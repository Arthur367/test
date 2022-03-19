import 'package:injectable/injectable.dart';
import 'package:mobile_pos/core/error/exceptions.dart';
import 'package:mobile_pos/database/billing_item/billing_item_dao.dart';
import 'package:mobile_pos/database/stock/stock_dao.dart';
import 'package:mobile_pos/database/transaction/transaction_dao.dart';
import 'package:mobile_pos/database/transaction/transactioned_items.dart';
import 'package:mobile_pos/features/billing/data/models/transactions/transactions_model.dart';
import 'package:mobile_pos/features/billing/domain/entities/transactions_entity.dart';

abstract class TransactionsLocalDataSource {
  Future<List<TransactionsModel>> retriveTransactions();

  Future<void> retrieveTransaction(TransactionEntity transaction);

  Future<List<TransactionItems>> getTransactionItemsList();
}

@LazySingleton(as: TransactionsLocalDataSource)
class TransactionsLocalDataSourceImpl implements TransactionsLocalDataSource {
  final TransactionDao _transactionDao;
  final BillingItemDao _billingItemDao;
  final StockDao _stockDao;

  const TransactionsLocalDataSourceImpl(
      this._transactionDao, this._billingItemDao, this._stockDao);

  @override
  Future<List<TransactionsModel>> retriveTransactions() async {
    // TODO: implement retriveTransactions
    try {
      var _transactions = await _transactionDao.getTransactions();
      return _transactions
          .map(
            (e) => TransactionsModel(
              id: e.id,
              transactionId: e.transactionId,
              total: e.total,
              tax: e.tax,
              subtotal: e.subtotal,
              customerId: e.customerId,
              customerName: e.customerName,
              customerEmail: e.customerEmail,
              customerPhone: e.customerPhone,
              invoiceId: e.invoiceId,
            ),
          )
          .toList();
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<void> retrieveTransaction(TransactionEntity transaction) async {
    // TODO: implement retrieveTransaction
    try {
      await _transactionDao.getTransaction(transaction.transactionId);
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<List<TransactionItems>> getTransactionItemsList() async {
    try {
      List<TransactionEntity> _transactions = await retriveTransactions();
      List<int> _billingItems = _transactions.map((e) => e.id).toList();

      var _transactionItems =
          await _transactionDao.transactionItems(_billingItems);

      return _transactionItems;
    } catch (e) {
      throw DatabaseException();
    }
  }
}
