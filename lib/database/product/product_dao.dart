import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/exceptions.dart';
import '../app_database.dart';
import '../tables.dart';

part 'product_dao.g.dart';

/// Product table operations CRUD
@lazySingleton
@DriftAccessor(tables: [ProductTable, StockTable, TaxTable])
class ProductDao extends DatabaseAccessor<AppDatabase> with _$ProductDaoMixin {
  ProductDao(AppDatabase db) : super(db);

  /// returns the generated id
  Future<int> insertProduct(ProductTableCompanion product) async {
    return await into(productTable)
        .insert(product)
        .onError((error, stackTrace) => throw DatabaseException());
  }

  /// Insert multiple products into products table.
  Future<void> insertMultipleProducts(
      List<ProductTableCompanion> products) async {
    await batch(
      (batch) => batch.insertAll(productTable, products),
    ).onError((error, stackTrace) => DatabaseException());
  }

  /// Retrieve a product with specific product code.
  Future<ProductDataClass?> productByCode(String productCode) {
    return (select(productTable)
          ..where((t) => t.productCode.equals(productCode)))
        .getSingleOrNull();
  }

  // Join product with stock data
  Future<List<ProductWithStock>> productsWithStock(
      List<int> stockItemIds) async {
    /// pick stock row where the stock id is the list of stockItemIds and
    /// join it with the corresponding product from the product table
    /// comparing the itemCode in stock and productCode in product table.
    ///
    /// This ensures stock dispatched with different batch numbers appear as
    /// as different products though the product is the same.
    final query = select(stockTable).join([
      innerJoin(
        productTable,
        productTable.productCode.equalsExp(stockTable.itemcode),
      ),
      innerJoin(taxTable, taxTable.taxId.equalsExp(productTable.taxTemplateId))
    ])
      ..where(stockTable.id.isIn(stockItemIds) &
          productTable.taxTemplateId.equalsExp(taxTable.taxId));

    final result = await query.get();

    return result
        .map((row) => ProductWithStock(
            product: row.readTable(productTable),
            stock: row.readTable(stockTable),
            tax: row.readTable(taxTable)))
        .toList();
  }
}
