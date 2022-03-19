import 'package:equatable/equatable.dart';

class CustomerEntity extends Equatable {
  final int? id;
  final String name;
  final String email;
  final int? phone;
  final String paymentMethod;

  const CustomerEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.paymentMethod,
  });

  @override
  List<Object?> get props => [id, name, email, phone, paymentMethod];
}
