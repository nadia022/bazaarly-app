import 'package:bazarly_app/features/cart/data/models/user_cart_response/user_cart_response.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepo {
  /// Adds a product to the cart using the [productId].
  /// Token is handled automatically by AuthInterceptor.
  Future<Either<String, String>> addToCart({required String productId});
  Future<Either<String, UserCartResponse>> fetchUserCart();

  /// Removes a product from the cart using the [productId].
  Future<Either<String, String>> removeFromCart({required String productId});

  /// Updates the quantity of a product in the cart using the [productId] and [quantity].
  Future<Either<String, String>> updateCartItemQuantity({
    required String productId,
    required String quantity,
  });

  /// Clears all items from the user's cart.
  Future<Either<String, String>> clearCart();
}
