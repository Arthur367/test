import 'package:equatable/equatable.dart';

class StockEntity extends Equatable {
  final int? id;
  final int autoNumber;
  final DateTime transactionDate;
  final String itemcode;
  final String itemname;
  final String description;
  final String batchnumber;
  final double batchQuantity;
  final double transactionQuantity;
  final double cumulativeQuantity;
  final double? availableQuantity;
  final double rate;
  final double masterRate;
  final double totalprice;
  final double closing;
  final DateTime createdAt;
  final DateTime updatedAt;

  const StockEntity({
    required this.id,
    required this.autoNumber,
    required this.transactionDate,
    required this.itemcode,
    required this.itemname,
    required this.description,
    required this.batchnumber,
    required this.batchQuantity,
    required this.transactionQuantity,
    required this.cumulativeQuantity,
    required this.availableQuantity,
    required this.rate,
    required this.masterRate,
    required this.totalprice,
    required this.closing,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        autoNumber,
        transactionDate,
        itemcode,
        itemname,
        description,
        batchnumber,
        batchQuantity,
        transactionQuantity,
        cumulativeQuantity,
        availableQuantity,
        rate,
        masterRate,
        totalprice,
        closing,
        createdAt,
        updatedAt,
      ];

  @override
  bool get stringify => true;
}
