import 'package:bazarly_app/core/utils/constants/api_keys.dart';
import 'package:bazarly_app/features/product/data/models/products_response/product_details.dart';
import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final int? count;
  final String? id;
  final ProductDetails? product;
  final num? price;

  const CartItem({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      count: json[ApiKeys.count] as int?,
      id: json[ApiKeys.id] as String?,
      product: json[ApiKeys.product] == null
          ? null
          : ProductDetails.fromJson(
              json[ApiKeys.product] as Map<String, dynamic>,
            ),
      price: json[ApiKeys.price] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
        ApiKeys.count: count,
        ApiKeys.id: id,
        ApiKeys.product: product?.toJson(),
        ApiKeys.price: price,
      };

  @override
  List<Object?> get props => [count, id, product, price];
}