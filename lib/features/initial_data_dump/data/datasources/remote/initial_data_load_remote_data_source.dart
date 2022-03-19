import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

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
      final _response = await client.get(
        BASE_URL + '/api/stock',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              'Token 50ecf5eb5902ae3d3b79afc7c23fcece821cc92c',
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
      final _response = await client.get(
        BASE_URL + '/api/store/products',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              'Token 50ecf5eb5902ae3d3b79afc7c23fcece821cc92c',
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
      final _response = await client.get(
        BASE_URL + '/api/tax-vat',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              'Token 50ecf5eb5902ae3d3b79afc7c23fcece821cc92c',
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
}
