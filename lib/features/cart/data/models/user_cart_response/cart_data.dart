import 'package:bazarly_app/core/utils/constants/api_keys.dart';
import 'package:bazarly_app/features/cart/data/models/user_cart_response/cart_item.dart';
import 'package:equatable/equatable.dart';


class CartData extends Equatable {
  final String? id;
  final String? cartOwner;
  final List<CartItem>? products;
  final int? totalCartPrice;
  final String? createdAt;
  final String? updatedAt;
  final int? version;

  const CartData({
    this.id,
    this.cartOwner,
    this.products,
    this.totalCartPrice,
    this.createdAt,
    this.updatedAt,
    this.version,
  });

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      id: json[ApiKeys.id] as String?,
      cartOwner: json[ApiKeys.cartOwner] as String?,
      products: (json[ApiKeys.products] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCartPrice: json[ApiKeys.totalCartPrice] as int?,
      createdAt: json[ApiKeys.createdAt] as String?,
      updatedAt: json[ApiKeys.updatedAt] as String?,
      version: json[ApiKeys.version] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        ApiKeys.id: id,
        ApiKeys.cartOwner: cartOwner,
        ApiKeys.products: products?.map((e) => e.toJson()).toList(),
        ApiKeys.totalCartPrice: totalCartPrice,
        ApiKeys.createdAt: createdAt,
        ApiKeys.updatedAt: updatedAt,
        ApiKeys.version: version,
      };

  @override
  List<Object?> get props => [
        id,
        cartOwner,
        products,
        totalCartPrice,
        createdAt,
        updatedAt,
        version,
      ];
}