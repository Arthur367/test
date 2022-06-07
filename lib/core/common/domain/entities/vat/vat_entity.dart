import 'package:equatable/equatable.dart';

class VatEntity extends Equatable {
  final int? id;
  final int autoNumber;
  final String vatId;
  final String vatName;
  final String flag;

  const VatEntity({
    required this.id,
    required this.autoNumber,
    required this.vatId,
    required this.vatName,
    required this.flag,
  });

  @override
  List<Object?> get props => [
        id,
        autoNumber,
        vatId,
        vatName,
        flag,
      ];

  @override
  bool get stringify => true;
}
