import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String username;
  final String name;
  final String useremail;

  const User({
    required this.username,
    required this.name,
    required this.useremail,
  });

  @override
  List<Object?> get props => [username, name, useremail];
}
