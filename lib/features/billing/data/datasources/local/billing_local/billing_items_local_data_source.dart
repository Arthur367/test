import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/features/billing/data/models/billing/billing_item_model.dart';

import '../../../../../../core/error/exceptions.dart';
import '../../../../../../database/app_database.dart';
import '../../../../../../database/daos.dart';
import '../../../../../../database/product_stock/product_with_stock.dart';
import '../../../../domain/entities/billing_item_entity.dart';

abstract class BillingItemsLocalDataSource {
  /// Add or update item details to local db.
  Future<void> addOrUpdateItem(BillingItemEntity item);

  /// Gets the list of stock items id and their quantity
  ///
  /// Throws [DatabaseException] if no cache data is set yet.
  Future<List<BillingItemModel>> retrieveBillingItems();

  /// Clears the billing items from local db
  ///
  /// Throws [DatabaseException] if an error occurs in the process
  Future<bool> removeItems();

  /// Removes specific item from local db
  ///
  /// Throws [DatabaseException] if an error occurs in the process
  Future<void> removeItem(BillingItemEntity item);

  /// Gets a list of products and stock [ProductWithStock] depending on items list
  ///
  /// Throws [DatabaseException] if an error occurs.
  Future<List<ProductWithStock>> getBillingProductsList();

  ///Checkout Billing Items
  Future<void> checkoutBillingItems(
      TransactionTableCompanion items, List<InvoiceTableCompanion> invoices);
}

@LazySingleton(as: BillingItemsLocalDataSource)
class BillingItemsLocalDataSourceImpl implements BillingItemsLocalDataSource {
  final ProductDao _productDao;
  final BillingItemDao _billingItemDao;
  final TransactionDao _transactionDao;
  final InvoiceDao _invoiceDao;
  const BillingItemsLocalDataSourceImpl(
    this._productDao,
    this._invoiceDao,
    this._transactionDao,
    this._billingItemDao,
  );

  @override
  Future<List<BillingItemModel>> retrieveBillingItems() async {
    try {
      var _items = await _billingItemDao.getBillingItems();
      return _items
          .map(
            (e) => BillingItemModel(
              stockItemId: e.stockItemId,
              quantity: e.quantity,
              stockItemPrice: e.unitPrice,
              stockItemCode: e.stockItemCode,
            ),
          )
          .toList();
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<List<ProductWithStock>> getBillingProductsList() async {
    try {
      // get stock item ids and their quantity from billing items table.
      List<BillingItemModel> _items = await retrieveBillingItems();

      // get stock item items only.
      List<int> _stockItems = _items.map((e) => e.stockItemId).toList();

      var _productWithStock = await _productDao.productsWithStock(_stockItems);
      return _productWithStock;
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<void> removeItem(BillingItemEntity item) async {
    try {
      await _billingItemDao.deleteItem(item.stockItemId);
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<bool> removeItems() async {
    try {
      await _billingItemDao.deleteAllItems();
      return true;
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<void> addOrUpdateItem(BillingItemEntity item) async {
    try {
      await _billingItemDao.insertOrUpdateItem(
        BillingItemTableCompanion(
            unitPrice: Value(item.unitPrice),
            stockItemId: Value(item.stockItemId),
            // if no quantity is set send a value.absent.
            // db will save it with a default value of 1.0
            quantity: Value(item.quantity),
            stockItemCode: Value(item.stockItemCode)),
      );
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<void> checkoutBillingItems(TransactionTableCompanion items,
      List<InvoiceTableCompanion> invoice) async {
    try {
      await _transactionDao
          .insert(items)
          .then((_) => _invoiceDao.insertMultiple(invoice));
    } catch (e) {
      print("error from database: $e");
      throw DatabaseException();
    }
  }
}
