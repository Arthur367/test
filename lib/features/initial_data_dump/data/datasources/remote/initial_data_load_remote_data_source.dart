import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/core/common/data/models/customer/customer_model.dart';
import 'package:mobile_pos/core/utils/shared_prefs.dart';
import 'package:mobile_pos/features/login/data/datasources/cache/auth_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/common/data/models/models.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/dio_config.dart';
import '../../responses/vat_tax_response.dart';

abstract class InitialDataLoadRemoteDataSource {
  /// Calls API endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<StockModel>> getStock();

  Future<List<CustomerModel>> getCustomer();

  /// Calls API endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<ProductModel>> getProducts();

  /// Calls API endpoint to get vat and tax.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<VatTaxResponse> getTaxVat();
}

@LazySingleton(as: InitialDataLoadRemoteDataSource)
class InitialDataLoadRemoteDataSourceImpl
    implements InitialDataLoadRemoteDataSource {
  final DioClient client;

  const InitialDataLoadRemoteDataSourceImpl({required this.client});

  @override
  Future<List<StockModel>> getStock() async {
    try {
      SharedPreferences _shared;
      _shared = await SharedPreferences.getInstance();
      var _token = _shared.getString('token');

      final _response = await client.get(
        BASE_URL + '/api/stock',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Token ${_token.toString()}',
        }),
      );
      return _response['stocks']
          .map<StockModel>((json) => StockModel.fromJson(json))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      SharedPreferences _shared;
      _shared = await SharedPreferences.getInstance();
      var _token = _shared.getString('token');
      final _response = await client.get(
        BASE_URL + '/api/store/products',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Token ${_token.toString()}'
        }),
      );
      return _response['products']
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<VatTaxResponse> getTaxVat() async {
    try {
      SharedPreferences _shared;
      _shared = await SharedPreferences.getInstance();
      var _token = _shared.getString('token');
      final _response = await client.get(
        BASE_URL + '/api/tax-vat',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Token ${_token.toString()}'
        }),
      );

      List<TaxModel> _taxes = _response['tax']
          .map<TaxModel>((json) => TaxModel.fromJson(json))
          .toList();
      List<VatModel> _vats = _response['vat']
          .map<VatModel>((json) => VatModel.fromJson(json))
          .toList();

      return VatTaxResponse(taxes: _taxes, vats: _vats);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CustomerModel>> getCustomer() async {
    // TODO: implement getCustomer
    try {
      SharedPreferences _shared;
      _shared = await SharedPreferences.getInstance();
      var _token = _shared.getString('token');
      final _response = await client.get(
        BASE_URL + '/api/customers',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Token ${_token.toString()}'
        }),
      );
      return _response['customers']
          .map<CustomerModel>((json) => CustomerModel.fromJson(json))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
