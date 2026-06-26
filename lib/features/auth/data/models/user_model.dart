import 'package:bazarly_app/core/utils/constants/api_keys.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? name;
  final String? email;
  final String? role;

  const UserModel({
    this.name,
    this.email,
    this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json[ApiKeys.name] as String?,
      email: json[ApiKeys.email] as String?,
      role: json[ApiKeys.role] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.name: name,
      ApiKeys.email: email,
      ApiKeys.role: role,
    };
  }

  @override
  List<Object?> get props => [
        name,
        email,
        role,
      ];
}