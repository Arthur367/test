import 'package:equatable/equatable.dart';

class StoreEntity extends Equatable {
  final int? id; // local database id field
  final String storeName;
  final String storeCode;
  final String storeLocationCode;

  const StoreEntity({
    required this.id,
    required this.storeName,
    required this.storeCode,
    required this.storeLocationCode,
  });

  @override
  List<Object?> get props => [id, storeName, storeCode, storeLocationCode];
}
