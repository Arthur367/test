import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/entities.dart';

part 'stock_model.g.dart';

@JsonSerializable()
class StockModel extends StockEntity {
  @JsonKey(name: 'auto_number')
  final int autoNumber_;
  @JsonKey(name: 'transaction_date')
  final DateTime transactionDate_;
  @JsonKey(
    name: 'batch_quantity',
    fromJson: _stringToDouble,
    toJson: _stringFromDouble,
  )
  final double batchQuantity_;
  @JsonKey(
    name: 'transaction_quantity',
    fromJson: _stringToDouble,
    toJson: _stringFromDouble,
  )
  final double transactionQuantity_;
  @JsonKey(
    name: 'cum_quantity',
    fromJson: _stringToDouble,
    toJson: _stringFromDouble,
  )
  final double cumulativeQuantity_;
  @JsonKey(
    name: 'master_rate',
    fromJson: _stringToDouble,
    toJson: _stringFromDouble,
  )
  final double masterRate_;
  @JsonKey(
    name: 'rate',
    fromJson: _stringToDouble,
    toJson: _stringFromDouble,
  )
  final double rate_;
  @JsonKey(
    name: 'totalprice',
    fromJson: _stringToDouble,
    toJson: _stringFromDouble,
  )
  final double totalprice_;
  @JsonKey(
    name: 'closing',
    fromJson: _stringToDouble,
    toJson: _stringFromDouble,
  )
  final double closing_;
  @JsonKey(name: 'created_at')
  final DateTime createdAt_;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt_;

  const StockModel({
    int? id,
    double? availableQuantity,
    required this.autoNumber_,
    required this.transactionDate_,
    required this.batchQuantity_,
    required this.transactionQuantity_,
    required this.cumulativeQuantity_,
    required this.createdAt_,
    required this.updatedAt_,
    required this.masterRate_,
    required String itemcode,
    required String itemname,
    required String description,
    required String batchnumber,
    required this.rate_,
    required this.totalprice_,
    required this.closing_,
  }) : super(
          id: id,
          autoNumber: autoNumber_,
          transactionDate: transactionDate_,
          itemcode: itemcode,
          itemname: itemname,
          description: description,
          batchnumber: batchnumber,
          batchQuantity: batchQuantity_,
          transactionQuantity: transactionQuantity_,
          cumulativeQuantity: cumulativeQuantity_,
          availableQuantity: availableQuantity,
          rate: rate_,
          masterRate: masterRate_,
          totalprice: totalprice_,
          closing: closing_,
          createdAt: createdAt_,
          updatedAt: updatedAt_,
        );

  factory StockModel.fromJson(Map<String, dynamic> data) =>
      _$StockModelFromJson(data);

  Map<String, dynamic> toJson() => _$StockModelToJson(this);

  /// converts some string values to double to be able to work
  /// with locally. API response is of String type.
  static int _stringToInt(String number) => int.parse(number);
  static String _stringFromInt(int number) => number.toString();

  static double _stringToDouble(String number) => double.parse(number);
  static String _stringFromDouble(double number) => number.toString();
}
