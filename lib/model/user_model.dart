import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String? email;

  @HiveField(1)
  String? number;

  @HiveField(2)
  String? address;

  @HiveField(3)
  String? password;

  User({
    required this.email,
    required this.number,
    required this.address,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] as String?,
      number: json['number'] as String?,
      address: json['address'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'number': number,
    'address': address,
    'password': password,
  };
}
