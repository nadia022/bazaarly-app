import 'package:equatable/equatable.dart';
import 'package:bazarly_app/core/utils/constants/api_keys.dart';

class SignUpRequestModel extends Equatable {
  final String name;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  const SignUpRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.name: name,
      ApiKeys.email: email,
      ApiKeys.password: password,
      ApiKeys.rePassword: rePassword,
      ApiKeys.phone: phone,
    };
  }

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        rePassword,
        phone,
      ];
}