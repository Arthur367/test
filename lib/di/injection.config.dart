// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:connectivity_plus/connectivity_plus.dart' as _i12;
import 'package:dio/dio.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i32;

import '../core/common/data/datasources/cache/initial_data_dumped/initial_data_dump_cache_data_source.dart'
    as _i62;
import '../core/common/data/datasources/cache/token/token_cache_data_source.dart'
    as _i41;
import '../core/common/data/datasources/datasources.dart' as _i30;
import '../core/common/data/datasources/local/stock/stock_local_data_source.dart'
    as _i37;
import '../core/common/data/repositories/initial_data_dumped/products_data_dumped_repository_impl.dart'
    as _i29;
import '../core/common/data/repositories/initial_data_dumped/stock_data_dumped_repository_impl.dart'
    as _i36;
import '../core/common/data/repositories/initial_data_dumped/vat_tax_data_dumped_repository_impl.dart'
    as _i51;
import '../core/common/data/repositories/stock/stock_repository_impl.dart'
    as _i38;
import '../core/common/data/repositories/token/token_repository_impl.dart'
    as _i43;
import '../core/common/domain/repositories/initial_data_dump/products_data_dumped_repository.dart'
    as _i24;
import '../core/common/domain/repositories/repositories.dart' as _i28;
import '../core/common/domain/usecases/initial_data_dumped/cache_initial_products_data_dumped_flag_usecase.dart'
    as _i54;
import '../core/common/domain/usecases/initial_data_dumped/cache_initial_stock_dumped_flag_usecase.dart'
    as _i55;
import '../core/common/domain/usecases/initial_data_dumped/cache_initial_vat_tax_data_dumped_flag_usecase.dart'
    as _i56;
import '../core/common/domain/usecases/initial_data_dumped/is_initial_products_data_dumped_usecase.dart'
    as _i23;
import '../core/common/domain/usecases/initial_data_dumped/is_initial_stock_dumped_usecase.dart'
    as _i66;
import '../core/common/domain/usecases/initial_data_dumped/is_initial_vat_tax_data_dumped_usecase.dart'
    as _i67;
import '../core/common/domain/usecases/stock/get_stock_usecase.dart' as _i60;
import '../core/common/domain/usecases/stock/update_stock_usecase.dart' as _i47;
import '../core/common/domain/usecases/token/cache_token_usecase.dart' as _i57;
import '../core/common/domain/usecases/token/clear_token.dart' as _i58;
import '../core/common/domain/usecases/token/get_user_token.dart' as _i61;
import '../core/common/domain/usecases/usecases.dart' as _i34;
import '../core/common/presentation/bloc/stock_bloc/stock_bloc.dart' as _i33;
import '../core/network/dio_config.dart' as _i59;
import '../core/network/network_info.dart' as _i26;
import '../database/app_database.dart' as _i3;
import '../database/billing_item/billing_item_dao.dart' as _i4;
import '../database/customers/customer_dao.dart' as _i13;
import '../database/daos.dart' as _i8;
import '../database/invoice/invoice_dao.dart' as _i19;
import '../database/location/location_dao.dart' as _i25;
import '../database/product/product_dao.dart' as _i27;
import '../database/stock/stock_dao.dart' as _i35;
import '../database/store/store_dao.dart' as _i39;
import '../database/tax/tax_dao.dart' as _i40;
import '../database/token/token_dao.dart' as _i42;
import '../database/transaction/transaction_dao.dart' as _i44;
import '../database/user/user_dao.dart' as _i48;
import '../database/vat/vat_dao.dart' as _i50;
import '../features/account/presentation/bloc/account_bloc.dart' as _i86;
import '../features/billing/data/datasources/local/billing_local/billing_items_local_data_source.dart'
    as _i7;
import '../features/billing/data/datasources/local/invoice/invoice_local_data_source.dart'
    as _i20;
import '../features/billing/data/datasources/local/transactions/transactions_local_data_source.dart'
    as _i46;
import '../features/billing/data/repositories/billing_items_repository_impl.dart'
    as _i10;
import '../features/billing/data/repositories/invoice_repository_impl.dart'
    as _i22;
import '../features/billing/data/repositories/transaction_repository_impl.dart'
    as _i77;
import '../features/billing/domain/repositories/billing_items_repository.dart'
    as _i9;
import '../features/billing/domain/repositories/invoice_repository.dart'
    as _i21;
import '../features/billing/domain/repositories/transaction_repository.dart'
    as _i76;
import '../features/billing/domain/usecases/add_update_item_usecase.dart'
    as _i52;
import '../features/billing/domain/usecases/clear_items_usecase.dart' as _i11;
import '../features/billing/domain/usecases/get_billing_products.dart' as _i15;
import '../features/billing/domain/usecases/remove_item_usecase.dart' as _i31;
import '../features/billing/domain/usecases/retrieve_items_usecase.dart'
    as _i18;
import '../features/billing/domain/usecases/retrieve_transactions.dart' as _i85;
import '../features/billing/domain/usecases/usecases.dart' as _i6;
import '../features/billing/presentation/bloc/billing_items/billing_items_bloc.dart'
    as _i5;
import '../features/billing/presentation/bloc/invoice/invoice_bloc.dart'
    as _i17;
import '../features/billing/presentation/bloc/stock_item_bloc/stock_item_bloc.dart'
    as _i75;
import '../features/billing/presentation/bloc/transactions/transactions_bloc.dart'
    as _i45;
import '../features/initial_data_dump/data/datasources/local/initial_data_dump_local_data_source.dart'
    as _i16;
import '../features/initial_data_dump/data/datasources/remote/initial_data_load_remote_data_source.dart'
    as _i63;
import '../features/initial_data_dump/data/repositories/initial_data_load_repository_impl.dart'
    as _i65;
import '../features/initial_data_dump/domain/repositories/initial_data_load_repository.dart'
    as _i64;
import '../features/initial_data_dump/domain/usecases/load_customer_data_usecase.dart'
    as _i68;
import '../features/initial_data_dump/domain/usecases/load_products_usecase.dart'
    as _i69;
import '../features/initial_data_dump/domain/usecases/load_stock_data_usecase.dart'
    as _i70;
import '../features/initial_data_dump/domain/usecases/load_vat_tax_data_usecase.dart'
    as _i71;
import '../features/initial_data_dump/presentation/bloc/initial_customer_load/initial_load_customer_bloc.dart'
    as _i80;
import '../features/initial_data_dump/presentation/bloc/initial_products_load_bloc/initial_products_load_bloc.dart'
    as _i81;
import '../features/initial_data_dump/presentation/bloc/initial_stock_load_bloc/initial_stock_load_bloc.dart'
    as _i82;
import '../features/initial_data_dump/presentation/bloc/initial_vat_tax_load_bloc/initial_vat_tax_load_bloc.dart'
    as _i83;
import '../features/login/data/datasources/cache/auth_local.dart' as _i53;
import '../features/login/data/datasources/local/user_local.dart' as _i49;
import '../features/login/data/datasources/remote/login_remote_datasource.dart'
    as _i72;
import '../features/login/data/repositories/login_repository_impl.dart' as _i74;
import '../features/login/domain/repositories/login_repository.dart' as _i73;
import '../features/login/domain/usecases/authenticate_user.dart' as _i78;
import '../features/login/domain/usecases/get_currentuser.dart' as _i79;
import '../features/login/presentation/bloc/login_bloc.dart' as _i84;
import 'module_injection.dart' as _i87; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModules = _$RegisterModules();
  gh.lazySingleton<_i3.AppDatabase>(() => _i3.AppDatabase());
  gh.lazySingleton<_i4.BillingItemDao>(
      () => _i4.BillingItemDao(get<_i3.AppDatabase>()));
  gh.factory<_i5.BillingItemsBloc>(() => _i5.BillingItemsBloc(
      get<_i6.ClearItemsUseCase>(),
      get<_i6.GetBillingProductsUseCase>(),
      get<_i6.AddOrUpdateItemUseCase>(),
      get<_i6.RetriveItemsUseCase>(),
      get<_i6.RemoveItemUseCase>()));
  gh.lazySingleton<_i7.BillingItemsLocalDataSource>(() =>
      _i7.BillingItemsLocalDataSourceImpl(
          get<_i8.ProductDao>(),
          get<_i8.InvoiceDao>(),
          get<_i8.TransactionDao>(),
          get<_i8.BillingItemDao>()));
  gh.lazySingleton<_i9.BillingItemsRepository>(() =>
      _i10.BillingItemsRepositoryImpl(get<_i7.BillingItemsLocalDataSource>()));
  gh.lazySingleton<_i11.ClearItemsUseCase>(
      () => _i11.ClearItemsUseCase(get<_i9.BillingItemsRepository>()));
  gh.lazySingleton<_i12.Connectivity>(() => registerModules.connectivity);
  gh.lazySingleton<_i13.CustomerDao>(
      () => _i13.CustomerDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i14.Dio>(() => registerModules.dio);
  gh.lazySingleton<_i15.GetBillingProductsUseCase>(
      () => _i15.GetBillingProductsUseCase(get<_i9.BillingItemsRepository>()));
  gh.lazySingleton<_i16.InitialDataDumpLocalDataSource>(() =>
      _i16.InitialDataDumpLocalSourceImpl(
          get<_i8.StockDao>(),
          get<_i8.ProductDao>(),
          get<_i8.TaxDao>(),
          get<_i8.VatDao>(),
          get<_i13.CustomerDao>()));
  gh.factory<_i17.InvoiceBloc>(() => _i17.InvoiceBloc(
      get<_i18.RetrieveInvoiceUseCase>(), get<_i18.RetrieveInvoicesUseCase>()));
  gh.lazySingleton<_i19.InvoiceDao>(
      () => _i19.InvoiceDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i20.InvoiceLocalDataSource>(
      () => _i20.InvoiceLocalDataSourceImp(get<_i19.InvoiceDao>()));
  gh.lazySingleton<_i21.InvoiceRepository>(
      () => _i22.InvoiceRepositoryImpl(get<_i20.InvoiceLocalDataSource>()));
  gh.lazySingleton<_i23.IsInitialProductsDataDumpedUseCase>(() =>
      _i23.IsInitialProductsDataDumpedUseCase(
          get<_i24.ProductsDataDumpedRepository>()));
  gh.lazySingleton<_i25.LocationDao>(
      () => _i25.LocationDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i26.NetworkInfo>(
      () => _i26.NetworkInfoImpl(get<_i12.Connectivity>()));
  gh.lazySingleton<_i27.ProductDao>(
      () => _i27.ProductDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i28.ProductsDataDumpedRepository>(() =>
      _i29.ProductsDataDumpedRepositoryImpl(
          get<_i30.InitialDataDumpCacheDataSource>()));
  gh.lazySingleton<_i31.RemoveItemUseCase>(
      () => _i31.RemoveItemUseCase(get<_i9.BillingItemsRepository>()));
  gh.lazySingleton<_i18.RetriveItemsUseCase>(
      () => _i18.RetriveItemsUseCase(get<_i9.BillingItemsRepository>()));
  await gh.factoryAsync<_i32.SharedPreferences>(() => registerModules.prefs,
      preResolve: true);
  gh.factory<_i33.StockBloc>(() => _i33.StockBloc(get<_i34.GetStockUseCase>()));
  gh.lazySingleton<_i35.StockDao>(() => _i35.StockDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i28.StockDataDumpedRepository>(() =>
      _i36.StockDataDumpedRepositoryImpl(
          get<_i30.InitialDataDumpCacheDataSource>()));
  gh.lazySingleton<_i37.StockLocalDataSource>(
      () => _i37.StockLocalDataSourceImpl(get<_i8.StockDao>()));
  gh.lazySingleton<_i28.StockRepository>(
      () => _i38.StockRepositoryImpl(get<_i30.StockLocalDataSource>()));
  gh.lazySingleton<_i39.StoreDao>(() => _i39.StoreDao(get<_i3.AppDatabase>()));
  gh.factory<String>(() => registerModules.baseUrl, instanceName: 'baseUrl');
  gh.lazySingleton<_i40.TaxDao>(() => _i40.TaxDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i41.TokenCacheDataSource>(
      () => _i41.TokenCacheDataSourceImpl(get<_i32.SharedPreferences>()));
  gh.lazySingleton<_i42.TokenDao>(() => _i42.TokenDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i28.TokenRepository>(
      () => _i43.TokenRepositoryImpl(get<_i30.TokenCacheDataSource>()));
  gh.lazySingleton<_i44.TransactionDao>(
      () => _i44.TransactionDao(get<_i3.AppDatabase>()));
  gh.factory<_i45.TransactionsBloc>(() => _i45.TransactionsBloc(
      get<_i6.RetrieveTransactionsUseCase>(),
      get<_i6.GetTransactionItemsUseCase>(),
      get<_i6.RetrieveTransactionUseCase>()));
  gh.lazySingleton<_i46.TransactionsLocalDataSource>(() =>
      _i46.TransactionsLocalDataSourceImpl(get<_i44.TransactionDao>(),
          get<_i4.BillingItemDao>(), get<_i35.StockDao>()));
  gh.lazySingleton<_i47.UpdateStockUseCase>(
      () => _i47.UpdateStockUseCase(get<_i28.StockRepository>()));
  gh.lazySingleton<_i48.UserDao>(() => _i48.UserDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i49.UserLocalDataSource>(() => _i49.UserLocalDataSourceImpl(
      get<_i8.UserDao>(),
      get<_i8.StoreDao>(),
      get<_i8.LocationDao>(),
      get<_i42.TokenDao>()));
  gh.lazySingleton<_i50.VatDao>(() => _i50.VatDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i28.VatTaxDataDumpedRepository>(() =>
      _i51.VatTaxDataDumpedRepositoryImpl(
          get<_i30.InitialDataDumpCacheDataSource>()));
  gh.lazySingleton<_i52.AddOrUpdateItemUseCase>(
      () => _i52.AddOrUpdateItemUseCase(get<_i9.BillingItemsRepository>()));
  gh.lazySingleton<_i53.AuthCacheDataSource>(() => _i53.AuthCacheDataSourceImpl(
      sharedPreferences: get<_i32.SharedPreferences>()));
  gh.lazySingleton<_i54.CacheInitialProductsDataDumpedFlagUseCase>(() =>
      _i54.CacheInitialProductsDataDumpedFlagUseCase(
          get<_i28.ProductsDataDumpedRepository>()));
  gh.lazySingleton<_i55.CacheInitialStockDumpedFlagUseCase>(() =>
      _i55.CacheInitialStockDumpedFlagUseCase(
          get<_i28.StockDataDumpedRepository>()));
  gh.lazySingleton<_i56.CacheInitialVatTaxDataDumpedFlagUseCase>(() =>
      _i56.CacheInitialVatTaxDataDumpedFlagUseCase(
          get<_i28.VatTaxDataDumpedRepository>()));
  gh.lazySingleton<_i57.CacheTokenUseCase>(
      () => _i57.CacheTokenUseCase(get<_i28.TokenRepository>()));
  gh.lazySingleton<_i58.ClearTokenUseCase>(
      () => _i58.ClearTokenUseCase(get<_i28.TokenRepository>()));
  gh.lazySingleton<_i59.DioClient>(() =>
      _i59.DioClient(get<String>(instanceName: 'baseUrl'), get<_i14.Dio>()));
  gh.lazySingleton<_i60.GetStockUseCase>(
      () => _i60.GetStockUseCase(get<_i28.StockRepository>()));
  gh.lazySingleton<_i61.GetUserTokenUseCase>(
      () => _i61.GetUserTokenUseCase(get<_i28.TokenRepository>()));
  gh.lazySingleton<_i62.InitialDataDumpCacheDataSource>(() =>
      _i62.InitialDataDumpCacheDataSourceImpl(get<_i32.SharedPreferences>()));
  gh.lazySingleton<_i63.InitialDataLoadRemoteDataSource>(() =>
      _i63.InitialDataLoadRemoteDataSourceImpl(client: get<_i59.DioClient>()));
  gh.lazySingleton<_i64.InitialDataLoadRepository>(() =>
      _i65.InitialDataLoadRepositoryImpl(
          get<_i63.InitialDataLoadRemoteDataSource>(),
          get<_i16.InitialDataDumpLocalDataSource>(),
          get<_i30.InitialDataDumpCacheDataSource>()));
  gh.lazySingleton<_i66.IsInitialStockDumpedUseCase>(() =>
      _i66.IsInitialStockDumpedUseCase(get<_i28.StockDataDumpedRepository>()));
  gh.lazySingleton<_i67.IsInitialVatTaxDataDumpedUseCase>(() =>
      _i67.IsInitialVatTaxDataDumpedUseCase(
          get<_i28.VatTaxDataDumpedRepository>()));
  gh.lazySingleton<_i68.LoadCustomerUseCase>(
      () => _i68.LoadCustomerUseCase(get<_i64.InitialDataLoadRepository>()));
  gh.lazySingleton<_i69.LoadProductsUseCase>(
      () => _i69.LoadProductsUseCase(get<_i64.InitialDataLoadRepository>()));
  gh.lazySingleton<_i70.LoadStockDataUseCase>(
      () => _i70.LoadStockDataUseCase(get<_i64.InitialDataLoadRepository>()));
  gh.lazySingleton<_i71.LoadVatTaxDataUseCase>(
      () => _i71.LoadVatTaxDataUseCase(get<_i64.InitialDataLoadRepository>()));
  gh.lazySingleton<_i72.LoginRemoteDataSource>(() =>
      _i72.LoginRemoteDataSourceImpl(
          client: get<_i59.DioClient>(),
          preferences: get<_i32.SharedPreferences>()));
  gh.lazySingleton<_i73.LoginRepository>(() => _i74.LoginRepositoryImpl(
      loginRemoteDataSource: get<_i72.LoginRemoteDataSource>(),
      tokenCacheDataSource: get<_i30.TokenCacheDataSource>(),
      userLocalDataSource: get<_i49.UserLocalDataSource>(),
      networkInfo: get<_i26.NetworkInfo>()));
  gh.factory<_i75.StockItemBloc>(() => _i75.StockItemBloc(
      get<_i6.AddOrUpdateItemUseCase>(),
      get<_i47.UpdateStockUseCase>(),
      get<_i6.RemoveItemUseCase>()));
  gh.lazySingleton<_i76.TransactionRepository>(() =>
      _i77.TransactionRespositoryImpl(get<_i46.TransactionsLocalDataSource>()));
  gh.lazySingleton<_i78.AuthenticateUser>(
      () => _i78.AuthenticateUser(get<_i73.LoginRepository>()));
  gh.lazySingleton<_i79.GetCurrentUser>(
      () => _i79.GetCurrentUser(get<_i73.LoginRepository>()));
  gh.lazySingleton<_i15.GetTransactionItemsUseCase>(
      () => _i15.GetTransactionItemsUseCase(get<_i76.TransactionRepository>()));
  gh.factory<_i80.InitialCustomerLoadBloc>(
      () => _i80.InitialCustomerLoadBloc(get<_i68.LoadCustomerUseCase>()));
  gh.factory<_i81.InitialProductsLoadBloc>(
      () => _i81.InitialProductsLoadBloc(get<_i69.LoadProductsUseCase>()));
  gh.factory<_i82.InitialStockLoadBloc>(
      () => _i82.InitialStockLoadBloc(get<_i70.LoadStockDataUseCase>()));
  gh.factory<_i83.InitialVatTaxLoadBloc>(
      () => _i83.InitialVatTaxLoadBloc(get<_i71.LoadVatTaxDataUseCase>()));
  gh.factory<_i84.LoginBloc>(() =>
      _i84.LoginBloc(get<_i78.AuthenticateUser>(), get<_i79.GetCurrentUser>()));
  gh.lazySingleton<_i85.RetrieveTransactionUseCase>(
      () => _i85.RetrieveTransactionUseCase(get<_i76.TransactionRepository>()));
  gh.lazySingleton<_i85.RetrieveTransactionsUseCase>(() =>
      _i85.RetrieveTransactionsUseCase(get<_i76.TransactionRepository>()));
  gh.factory<_i86.AccountBloc>(
      () => _i86.AccountBloc(get<_i79.GetCurrentUser>()));
  return get;
}

class _$RegisterModules extends _i87.RegisterModules {}
