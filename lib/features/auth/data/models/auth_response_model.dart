import 'package:bazarly_app/core/utils/constants/api_keys.dart';
import 'package:bazarly_app/features/auth/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

class AuthResponseModel extends Equatable {
  final String? message;
  final String? token;
  final UserModel? user;

  const AuthResponseModel({this.message, this.token, this.user});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      message: json[ApiKeys.message],
      token: json[ApiKeys.token],
      user: json[ApiKeys.user] != null
          ? UserModel.fromJson(json[ApiKeys.user])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.message: message,
      ApiKeys.token: token,
      ApiKeys.user: user?.toJson(),
    };
  }

  @override
  List<Object?> get props => [message, token, user];
}
