// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:connectivity_plus/connectivity_plus.dart' as _i12;
import 'package:dio/dio.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobile_pos/features/billing/presentation/bloc/blocs.dart';
import 'package:mobile_pos/features/billing/presentation/bloc/invoice/invoice_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart' as _i27;

import '../core/common/data/datasources/cache/initial_data_dumped/initial_data_dump_cache_data_source.dart'
    as _i54;
import '../core/common/data/datasources/cache/token/token_cache_data_source.dart'
    as _i36;
import '../core/common/data/datasources/datasources.dart' as _i24;
import '../core/common/data/datasources/local/stock/stock_local_data_source.dart'
    as _i32;
import '../core/common/data/repositories/initial_data_dumped/products_data_dumped_repository_impl.dart'
    as _i23;
import '../core/common/data/repositories/initial_data_dumped/stock_data_dumped_repository_impl.dart'
    as _i31;
import '../core/common/data/repositories/initial_data_dumped/vat_tax_data_dumped_repository_impl.dart'
    as _i43;
import '../core/common/data/repositories/stock/stock_repository_impl.dart'
    as _i33;
import '../core/common/data/repositories/token/token_repository_impl.dart'
    as _i37;
import '../core/common/domain/repositories/initial_data_dump/products_data_dumped_repository.dart'
    as _i18;
import '../core/common/domain/repositories/repositories.dart' as _i22;
import '../core/common/domain/usecases/initial_data_dumped/cache_initial_products_data_dumped_flag_usecase.dart'
    as _i46;
import '../core/common/domain/usecases/initial_data_dumped/cache_initial_stock_dumped_flag_usecase.dart'
    as _i47;
import '../core/common/domain/usecases/initial_data_dumped/cache_initial_vat_tax_data_dumped_flag_usecase.dart'
    as _i48;
import '../core/common/domain/usecases/initial_data_dumped/is_initial_products_data_dumped_usecase.dart'
    as _i17;
import '../core/common/domain/usecases/initial_data_dumped/is_initial_stock_dumped_usecase.dart'
    as _i58;
import '../core/common/domain/usecases/initial_data_dumped/is_initial_vat_tax_data_dumped_usecase.dart'
    as _i59;
import '../core/common/domain/usecases/stock/get_stock_usecase.dart' as _i52;
import '../core/common/domain/usecases/stock/update_stock_usecase.dart' as _i39;
import '../core/common/domain/usecases/token/cache_token_usecase.dart' as _i49;
import '../core/common/domain/usecases/token/clear_token.dart' as _i50;
import '../core/common/domain/usecases/token/get_user_token.dart' as _i53;
import '../core/common/domain/usecases/usecases.dart' as _i29;
import '../core/common/presentation/bloc/stock_bloc/stock_bloc.dart' as _i28;
import '../core/network/dio_config.dart' as _i51;
import '../core/network/network_info.dart' as _i20;
import '../database/app_database.dart' as _i3;
import '../database/billing_item/billing_item_dao.dart' as _i4;
import '../database/daos.dart' as _i8;
import '../database/invoice/invoice_dao.dart' as _i16;
import '../database/location/location_dao.dart' as _i19;
import '../database/product/product_dao.dart' as _i21;
import '../database/stock/stock_dao.dart' as _i30;
import '../database/store/store_dao.dart' as _i34;
import '../database/tax/tax_dao.dart' as _i35;
import '../database/transaction/transaction_dao.dart' as _i38;
import '../database/user/user_dao.dart' as _i40;
import '../database/vat/vat_dao.dart' as _i42;
import '../features/account/presentation/bloc/account_bloc.dart' as _i73;
import '../features/billing/data/datasources/local/billing_local/billing_items_local_data_source.dart'
    as _i7;
import '../features/billing/data/repositories/billing_items_repository_impl.dart'
    as _i10;
import '../features/billing/domain/repositories/billing_items_repository.dart'
    as _i9;
import '../features/billing/domain/usecases/add_update_item_usecase.dart'
    as _i44;

import '../features/billing/domain/usecases/clear_items_usecase.dart' as _i11;
import '../features/billing/domain/usecases/get_billing_products.dart' as _i14;
import '../features/billing/domain/usecases/remove_item_usecase.dart' as _i25;
import '../features/billing/domain/usecases/retrieve_items_usecase.dart'
    as _i26;
import '../features/billing/domain/usecases/usecases.dart' as _i6;
import '../features/billing/presentation/bloc/billing_items/billing_items_bloc.dart'
    as _i5;
import '../features/billing/presentation/bloc/stock_item_bloc/stock_item_bloc.dart'
    as _i66;
import '../features/initial_data_dump/data/datasources/local/initial_data_dump_local_data_source.dart'
    as _i15;
import '../features/initial_data_dump/data/datasources/remote/initial_data_load_remote_data_source.dart'
    as _i55;
import '../features/initial_data_dump/data/repositories/initial_data_load_repository_impl.dart'
    as _i57;
import '../features/initial_data_dump/domain/repositories/initial_data_load_repository.dart'
    as _i56;
import '../features/initial_data_dump/domain/usecases/load_products_usecase.dart'
    as _i60;
import '../features/initial_data_dump/domain/usecases/load_stock_data_usecase.dart'
    as _i61;
import '../features/initial_data_dump/domain/usecases/load_vat_tax_data_usecase.dart'
    as _i62;
import '../features/initial_data_dump/presentation/bloc/initial_products_load_bloc/initial_products_load_bloc.dart'
    as _i69;
import '../features/initial_data_dump/presentation/bloc/initial_stock_load_bloc/initial_stock_load_bloc.dart'
    as _i70;
import '../features/initial_data_dump/presentation/bloc/initial_vat_tax_load_bloc/initial_vat_tax_load_bloc.dart'
    as _i71;
import '../features/login/data/datasources/cache/auth_local.dart' as _i45;
import '../features/login/data/datasources/local/user_local.dart' as _i41;
import '../features/login/data/datasources/remote/login_remote_datasource.dart'
    as _i63;
import '../features/login/data/repositories/login_repository_impl.dart' as _i65;
import '../features/login/domain/repositories/login_repository.dart' as _i64;
import '../features/login/domain/usecases/authenticate_user.dart' as _i67;
import '../features/login/domain/usecases/get_currentuser.dart' as _i68;
import '../features/login/presentation/bloc/login_bloc.dart' as _i72;

import 'module_injection.dart' as _i74; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i13.Dio>(() => registerModules.dio);
  gh.lazySingleton<_i14.GetBillingProductsUseCase>(
      () => _i14.GetBillingProductsUseCase(get<_i9.BillingItemsRepository>()));
  gh.lazySingleton<_i15.InitialDataDumpLocalDataSource>(() =>
      _i15.InitialDataDumpLocalSourceImpl(get<_i8.StockDao>(),
          get<_i8.ProductDao>(), get<_i8.TaxDao>(), get<_i8.VatDao>()));
  gh.lazySingleton<_i16.InvoiceDao>(
      () => _i16.InvoiceDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i17.IsInitialProductsDataDumpedUseCase>(() =>
      _i17.IsInitialProductsDataDumpedUseCase(
          get<_i18.ProductsDataDumpedRepository>()));
  gh.lazySingleton<_i19.LocationDao>(
      () => _i19.LocationDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i20.NetworkInfo>(
      () => _i20.NetworkInfoImpl(get<_i12.Connectivity>()));
  gh.lazySingleton<_i21.ProductDao>(
      () => _i21.ProductDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i22.ProductsDataDumpedRepository>(() =>
      _i23.ProductsDataDumpedRepositoryImpl(
          get<_i24.InitialDataDumpCacheDataSource>()));
  gh.lazySingleton<_i25.RemoveItemUseCase>(
      () => _i25.RemoveItemUseCase(get<_i9.BillingItemsRepository>()));
  gh.lazySingleton<_i26.RetriveItemsUseCase>(
      () => _i26.RetriveItemsUseCase(get<_i9.BillingItemsRepository>()));
  await gh.factoryAsync<_i27.SharedPreferences>(() => registerModules.prefs,
      preResolve: true);
  gh.factory<_i28.StockBloc>(() => _i28.StockBloc(get<_i29.GetStockUseCase>()));
  gh.lazySingleton<_i30.StockDao>(() => _i30.StockDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i22.StockDataDumpedRepository>(() =>
      _i31.StockDataDumpedRepositoryImpl(
          get<_i24.InitialDataDumpCacheDataSource>()));
  gh.lazySingleton<_i32.StockLocalDataSource>(
      () => _i32.StockLocalDataSourceImpl(get<_i8.StockDao>()));
  gh.lazySingleton<_i22.StockRepository>(
      () => _i33.StockRepositoryImpl(get<_i24.StockLocalDataSource>()));
  gh.lazySingleton<_i34.StoreDao>(() => _i34.StoreDao(get<_i3.AppDatabase>()));
  gh.factory<String>(() => registerModules.baseUrl, instanceName: 'baseUrl');
  gh.lazySingleton<_i35.TaxDao>(() => _i35.TaxDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i36.TokenCacheDataSource>(
      () => _i36.TokenCacheDataSourceImpl(get<_i27.SharedPreferences>()));
  gh.lazySingleton<_i22.TokenRepository>(
      () => _i37.TokenRepositoryImpl(get<_i24.TokenCacheDataSource>()));
  gh.lazySingleton<_i38.TransactionDao>(
      () => _i38.TransactionDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i39.UpdateStockUseCase>(
      () => _i39.UpdateStockUseCase(get<_i22.StockRepository>()));
  gh.lazySingleton<_i40.UserDao>(() => _i40.UserDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i41.UserLocalDataSource>(() => _i41.UserLocalDataSourceImpl(
      get<_i40.UserDao>(), get<_i8.StoreDao>(), get<_i8.LocationDao>()));
  gh.lazySingleton<_i42.VatDao>(() => _i42.VatDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i22.VatTaxDataDumpedRepository>(() =>
      _i43.VatTaxDataDumpedRepositoryImpl(
          get<_i24.InitialDataDumpCacheDataSource>()));
  gh.lazySingleton<_i44.AddOrUpdateItemUseCase>(
      () => _i44.AddOrUpdateItemUseCase(get<_i9.BillingItemsRepository>()));
  gh.lazySingleton<_i45.AuthCacheDataSource>(() => _i45.AuthCacheDataSourceImpl(
      sharedPreferences: get<_i27.SharedPreferences>()));
  gh.lazySingleton<_i46.CacheInitialProductsDataDumpedFlagUseCase>(() =>
      _i46.CacheInitialProductsDataDumpedFlagUseCase(
          get<_i22.ProductsDataDumpedRepository>()));
  gh.lazySingleton<_i47.CacheInitialStockDumpedFlagUseCase>(() =>
      _i47.CacheInitialStockDumpedFlagUseCase(
          get<_i22.StockDataDumpedRepository>()));
  gh.lazySingleton<_i48.CacheInitialVatTaxDataDumpedFlagUseCase>(() =>
      _i48.CacheInitialVatTaxDataDumpedFlagUseCase(
          get<_i22.VatTaxDataDumpedRepository>()));
  gh.lazySingleton<_i49.CacheTokenUseCase>(
      () => _i49.CacheTokenUseCase(get<_i22.TokenRepository>()));
  gh.lazySingleton<_i50.ClearTokenUseCase>(
      () => _i50.ClearTokenUseCase(get<_i22.TokenRepository>()));
  gh.lazySingleton<_i51.DioClient>(() =>
      _i51.DioClient(get<String>(instanceName: 'baseUrl'), get<_i13.Dio>()));
  gh.lazySingleton<_i52.GetStockUseCase>(
      () => _i52.GetStockUseCase(get<_i22.StockRepository>()));
  gh.lazySingleton<_i53.GetUserTokenUseCase>(
      () => _i53.GetUserTokenUseCase(get<_i22.TokenRepository>()));
  gh.lazySingleton<_i54.InitialDataDumpCacheDataSource>(() =>
      _i54.InitialDataDumpCacheDataSourceImpl(get<_i27.SharedPreferences>()));
  gh.lazySingleton<_i55.InitialDataLoadRemoteDataSource>(() =>
      _i55.InitialDataLoadRemoteDataSourceImpl(client: get<_i51.DioClient>()));
  gh.lazySingleton<_i56.InitialDataLoadRepository>(() =>
      _i57.InitialDataLoadRepositoryImpl(
          get<_i55.InitialDataLoadRemoteDataSource>(),
          get<_i15.InitialDataDumpLocalDataSource>(),
          get<_i24.InitialDataDumpCacheDataSource>()));
  gh.lazySingleton<_i58.IsInitialStockDumpedUseCase>(() =>
      _i58.IsInitialStockDumpedUseCase(get<_i22.StockDataDumpedRepository>()));
  gh.lazySingleton<_i59.IsInitialVatTaxDataDumpedUseCase>(() =>
      _i59.IsInitialVatTaxDataDumpedUseCase(
          get<_i22.VatTaxDataDumpedRepository>()));
  gh.lazySingleton<_i60.LoadProductsUseCase>(
      () => _i60.LoadProductsUseCase(get<_i56.InitialDataLoadRepository>()));
  gh.lazySingleton<_i61.LoadStockDataUseCase>(
      () => _i61.LoadStockDataUseCase(get<_i56.InitialDataLoadRepository>()));
  gh.lazySingleton<_i62.LoadVatTaxDataUseCase>(
      () => _i62.LoadVatTaxDataUseCase(get<_i56.InitialDataLoadRepository>()));
  gh.lazySingleton<_i63.LoginRemoteDataSource>(
      () => _i63.LoginRemoteDataSourceImpl(client: get<_i51.DioClient>()));
  gh.lazySingleton<_i64.LoginRepository>(() => _i65.LoginRepositoryImpl(
      loginRemoteDataSource: get<_i63.LoginRemoteDataSource>(),
      tokenCacheDataSource: get<_i24.TokenCacheDataSource>(),
      userLocalDataSource: get<_i41.UserLocalDataSource>(),
      networkInfo: get<_i20.NetworkInfo>()));
  gh.factory<_i66.StockItemBloc>(() => _i66.StockItemBloc(
      get<_i6.AddOrUpdateItemUseCase>(),
      get<_i39.UpdateStockUseCase>(),
      get<_i6.RemoveItemUseCase>()));
  gh.lazySingleton<_i67.AuthenticateUser>(
      () => _i67.AuthenticateUser(get<_i64.LoginRepository>()));
  gh.lazySingleton<_i68.GetCurrentUser>(
      () => _i68.GetCurrentUser(get<_i64.LoginRepository>()));
  gh.factory<_i69.InitialProductsLoadBloc>(
      () => _i69.InitialProductsLoadBloc(get<_i60.LoadProductsUseCase>()));
  gh.factory<_i70.InitialStockLoadBloc>(
      () => _i70.InitialStockLoadBloc(get<_i61.LoadStockDataUseCase>()));
  gh.factory<_i71.InitialVatTaxLoadBloc>(
      () => _i71.InitialVatTaxLoadBloc(get<_i62.LoadVatTaxDataUseCase>()));
  gh.factory<_i72.LoginBloc>(() =>
      _i72.LoginBloc(get<_i67.AuthenticateUser>(), get<_i68.GetCurrentUser>()));
  gh.factory<_i73.AccountBloc>(
      () => _i73.AccountBloc(get<_i68.GetCurrentUser>()));

  gh.factory<InvoiceBloc>(() => InvoiceBloc(
      get<_i26.RetrieveInvoiceUseCase>(), get<_i26.RetrieveInvoicesUseCase>()));

  return get;
}

class _$RegisterModules extends _i74.RegisterModules {}
