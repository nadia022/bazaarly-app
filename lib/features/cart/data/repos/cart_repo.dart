import 'package:bazarly_app/features/cart/data/models/user_cart_response/user_cart_response.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepo {
  /// Adds a product to the cart using the [productId].
  /// Token is handled automatically by AuthInterceptor.
  Future<Either<String, String>> addToCart({
    required String productId,
  });
  Future<Either<String, UserCartResponse>> fetchUserCart();
}