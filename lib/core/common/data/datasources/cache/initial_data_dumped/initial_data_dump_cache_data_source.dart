import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants.dart';
import '../../../../../error/exceptions.dart';

/// cache interactions base class.
abstract class InitialDataDumpCacheDataSource {
  /// sets initial products dumped status [bool].
  Future<void> setInitialProductsDumpedStatus(bool status);

  /// Retrieves initial products dumped status [bool] or
  /// [null] if field not set.
  ///
  /// throws  [CacheException] whe cache error occurs.
  Future<bool?> getInitialProductsDumpedStatus();

  Future<bool?> getInitialCustomerDumpdeStatus();
  Future<void> setInitialCustomerDumpedStatus(bool status);

  /// sets initial stock dumped status [bool].
  Future<void> setInitialStockDumpedStatus(bool status);

  /// Retrieves initial stock dumped status [bool] or
  /// [null] if field not set.
  ///
  /// throws  [CacheException] whe cache error occurs.
  Future<bool?> getInitialStockDumpedStatus();

  /// sets initial vat tax dumped status [bool].
  Future<void> setInitialVatTaxDumpedStatus(bool status);

  /// Retrieves initial vat and tax dumped status [bool] or
  /// [null] if field not set.
  ///
  /// throws  [CacheException] whe cache error occurs.
  Future<bool?> getInitialVatTaxDumpedStatus();
}

@LazySingleton(as: InitialDataDumpCacheDataSource)
class InitialDataDumpCacheDataSourceImpl
    implements InitialDataDumpCacheDataSource {
  final SharedPreferences _prefs;

  const InitialDataDumpCacheDataSourceImpl(this._prefs);

  @override
  Future<bool?> getInitialProductsDumpedStatus() async {
    try {
      return _prefs.getBool(INITIAL_DATA_DUMPED_PRODUCT);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<bool?> getInitialStockDumpedStatus() async {
    try {
      return _prefs.getBool(INITIAL_DATA_DUMPED_STOCK);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> setInitialProductsDumpedStatus(bool status) {
    try {
      return _prefs.setBool(INITIAL_DATA_DUMPED_PRODUCT, status);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> setInitialStockDumpedStatus(bool status) {
    try {
      return _prefs.setBool(INITIAL_DATA_DUMPED_STOCK, status);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<bool?> getInitialVatTaxDumpedStatus() async {
    try {
      return _prefs.getBool(INITIAL_DATA_DUMPED_VAT_TAX);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> setInitialVatTaxDumpedStatus(bool status) {
    try {
      return _prefs.setBool(INITIAL_DATA_DUMPED_VAT_TAX, status);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<bool?> getInitialCustomerDumpdeStatus() async {
    try {
      return _prefs.getBool(INTIAL_DATA_DUMPED_CUSTOMER);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> setInitialCustomerDumpedStatus(bool status) {
    try {
      return _prefs.setBool(INTIAL_DATA_DUMPED_CUSTOMER, status);
    } catch (e) {
      throw CacheException();
    }
  }
}
