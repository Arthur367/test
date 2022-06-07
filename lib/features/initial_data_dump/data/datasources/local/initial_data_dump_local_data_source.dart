import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/core/common/data/models/customer/customer_model.dart';
import 'package:mobile_pos/database/customers/customer_dao.dart';

import '../../../../../core/common/data/models/models.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../database/app_database.dart';
import '../../../../../database/daos.dart';

/// interactions with the local DB data
abstract class InitialDataDumpLocalDataSource {
  Future<void> insertMultipleStock(List<StockModel> stocks);

  Future<List<StockModel>> retrieveStock();

  Future<void> insertMultipleProducts(List<ProductModel> products);

  Future<void> insertMultipleTax(List<TaxModel> taxes);

  Future<void> insertMultipleVat(List<VatModel> vats);

  Future<void> insertCustomer(List<CustomerModel> customers);
}

@LazySingleton(as: InitialDataDumpLocalDataSource)
class InitialDataDumpLocalSourceImpl implements InitialDataDumpLocalDataSource {
  final StockDao _stockDao;
  final ProductDao _productDao;
  final TaxDao _taxDao;
  final VatDao _vatDao;
  final CustomerDao _customerDao;

  const InitialDataDumpLocalSourceImpl(this._stockDao, this._productDao,
      this._taxDao, this._vatDao, this._customerDao);

  @override
  Future<void> insertMultipleStock(List<StockModel> stocks) {
    try {
      return _stockDao.insertMultipleStock(stocks
          .map(
            (e) => StockTableCompanion(
                autoNumber: Value(e.autoNumber_),
                batchQauntity: Value(e.batchQuantity_),
                batchnumber: Value(e.batchnumber),
                closing: Value(e.closing_),
                cumulativeQauntity: Value(e.cumulativeQuantity_),
                description: Value(e.description),
                itemcode: Value(e.itemcode),
                itemname: Value(e.itemname),
                rate: Value(e.rate_),
                masterRate: Value(e.masterRate_),
                totalprice: Value(e.totalprice_),
                transactionDate: Value(e.transactionDate_),
                transactionQauntity: Value(e.transactionQuantity_),
                availableQuantity: Value(e.cumulativeQuantity_),
                createdAt: Value(e.createdAt_),
                updatedAt: Value(e.updatedAt_),
                locationCode: Value(e.locationCode),
                storecode: Value(e.storecode)),
          )
          .toList());
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<List<StockModel>> retrieveStock() async {
    try {
      var _stocks = await _stockDao.selectAllStock();
      return _stocks
          .map((row) => StockModel(
              id: row.id,
              autoNumber_: row.autoNumber,
              transactionDate_: row.transactionDate,
              batchQuantity_: row.batchQauntity,
              transactionQuantity_: row.transactionQauntity,
              cumulativeQuantity_: row.cumulativeQauntity,
              createdAt_: row.createdAt,
              masterRate_: row.masterRate,
              itemcode: row.itemcode,
              itemname: row.itemname,
              description: row.description,
              batchnumber: row.batchnumber,
              rate_: row.rate,
              totalprice_: row.totalprice,
              closing_: row.closing,
              updatedAt_: row.updatedAt,
              locationCode: row.locationCode,
              storecode: row.storecode))
          .toList();
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<void> insertMultipleProducts(List<ProductModel> products) {
    try {
      return _productDao.insertMultipleProducts(products
          .map(
            (e) => ProductTableCompanion(
              autoNumber: Value(e.autoNumber_),
              barCode: Value(e.barCode_),
              costPrice: Value(e.costPrice_),
              costVariance: Value(e.costVariance_),
              inclusiveTax: Value(e.inclusiveTax_),
              isBatch: Value(e.isBatch_),
              isExpDate: Value(e.isExpDate_),
              isInclusive: Value(e.inclusiveTax_),
              isLot: Value(e.isLot_),
              maxStock: Value(e.maxStock_),
              minStock: Value(e.minStock_),
              productCode: Value(e.productCode_),
              productName: Value(e.productName_),
              productShortCode: Value(e.productShortCode_),
              salesPrice: Value(e.salesPrice_),
              tax: Value(e.tax_),
              vatType: Value(e.vatType_),
              taxTemplateId: Value(e.taxTemplateId_),
            ),
          )
          .toList());
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<void> insertMultipleTax(List<TaxModel> taxes) {
    try {
      return _taxDao.insertMultipleTax(taxes
          .map(
            (e) => TaxTableCompanion(
              autoNumber: Value(e.autoNumber_),
              excludeGoods: Value(e.excludeGoods_),
              taxId: Value(e.taxId_),
              taxName: Value(e.taxName_),
              taxPercent: Value(e.taxPercent_),
            ),
          )
          .toList());
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<void> insertMultipleVat(List<VatModel> vats) async {
    try {
      return await _vatDao.insertMultipleVat(
        vats
            .map(
              (e) => VatTableCompanion(
                autoNumber: Value(e.autoNumber_),
                flag: Value(e.flag),
                vatName: Value(e.vatName_),
                vatId: Value(e.vatId_),
              ),
            )
            .toList(),
      );
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<void> insertCustomer(List<CustomerModel> customers) {
    // TODO: implement insertCustomer
    try {
      return _customerDao.insertMultiple(customers
          .map((e) => CustomerTableCompanion(
              customerId: Value(e.customerId), customerName: Value(e.name)))
          .toList());
    } catch (e) {
      throw DatabaseException();
    }
  }
}
