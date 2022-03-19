import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String username;
  final String name;

  const User({
    required this.username,
    required this.name,
  });

  @override
  List<Object?> get props => [username, name];
}
