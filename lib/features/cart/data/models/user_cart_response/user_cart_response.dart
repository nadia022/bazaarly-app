import 'package:bazarly_app/core/utils/constants/api_keys.dart';
import 'package:equatable/equatable.dart';
import 'cart_data.dart';

class UserCartResponse extends Equatable {
  final String? status;
  final int? numOfCartItems;
  final String? cartId;
  final CartData? data;

  const UserCartResponse({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  factory UserCartResponse.fromJson(Map<String, dynamic> json) {
    return UserCartResponse(
      status: json[ApiKeys.status] as String?,
      numOfCartItems: json[ApiKeys.numOfCartItems] as int?,
      cartId: json[ApiKeys.cartId] as String?,
      data: json[ApiKeys.data] == null
          ? null
          : CartData.fromJson(json[ApiKeys.data] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        ApiKeys.status: status,
        ApiKeys.numOfCartItems: numOfCartItems,
        ApiKeys.cartId: cartId,
        ApiKeys.data: data?.toJson(),
      };

  @override
  List<Object?> get props => [status, numOfCartItems, cartId, data];
}