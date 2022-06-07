import 'package:equatable/equatable.dart';

class CustomerEntity extends Equatable {
  final int? id;
  final String customerId;
  final String name;

  const CustomerEntity(
      {required this.id, required this.customerId, required this.name});

  @override
  List<Object?> get props => [id, customerId, name];
}
