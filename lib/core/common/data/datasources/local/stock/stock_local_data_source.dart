import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/database/app_database.dart';

import '../../../../../../database/daos.dart';
import '../../../../../error/exceptions.dart';
import '../../../models/models.dart';

abstract class StockLocalDataSource {
  Future<List<StockModel>> retrieveStock();
  Future<void> updateStock(StockModel stock);
}

@LazySingleton(as: StockLocalDataSource)
class StockLocalDataSourceImpl implements StockLocalDataSource {
  final StockDao _stockDao;

  const StockLocalDataSourceImpl(this._stockDao);

  @override
  Future<List<StockModel>> retrieveStock() async {
    try {
      var _stocks = await _stockDao.selectAllStock();
      return _stocks
          .map(
            (row) => StockModel(
              id: row.id,
              autoNumber_: row.autoNumber,
              transactionDate_: row.transactionDate,
              batchQuantity_: row.batchQauntity,
              transactionQuantity_: row.transactionQauntity,
              cumulativeQuantity_: row.cumulativeQauntity,
              availableQuantity: row.availableQuantity,
              masterRate_: row.masterRate,
              itemcode: row.itemcode,
              itemname: row.itemname,
              description: row.description,
              batchnumber: row.batchnumber,
              rate_: row.rate,
              totalprice_: row.totalprice,
              closing_: row.closing,
              createdAt_: row.createdAt,
              updatedAt_: row.updatedAt,
              storecode: row.storecode,
              locationCode: row.locationCode,
            ),
          )
          .toList();
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<void> updateStock(StockModel stock) async {
    print("Let's check here");
    print(stock);
    await _stockDao.updateStock(StockTableCompanion(
        id: Value(stock.id!),
        autoNumber: Value(stock.autoNumber_),
        batchQauntity: Value(stock.batchQuantity_),
        batchnumber: Value(stock.batchnumber),
        closing: Value(stock.closing_),
        cumulativeQauntity: Value(stock.cumulativeQuantity_),
        description: Value(stock.description),
        itemcode: Value(stock.itemcode),
        itemname: Value(stock.itemname),
        rate: Value(stock.rate_),
        masterRate: Value(stock.masterRate_),
        totalprice: Value(stock.totalprice_),
        transactionDate: Value(stock.transactionDate_),
        transactionQauntity: Value(stock.transactionQuantity_),
        availableQuantity: Value(stock.availableQuantity!),
        createdAt: Value(stock.createdAt_),
        updatedAt: Value(DateTime.now()),
        storecode: Value(stock.storecode),
        locationCode: Value(stock.locationCode)));
  }
}
