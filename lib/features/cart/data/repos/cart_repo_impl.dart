import 'package:bazarly_app/core/errors/exceptions/api_exception.dart';
import 'package:bazarly_app/core/network/api_consumer.dart';
import 'package:bazarly_app/core/utils/constants/api_endpoints.dart';
import 'package:bazarly_app/core/utils/constants/api_keys.dart';
import 'package:bazarly_app/features/cart/data/models/user_cart_response/user_cart_response.dart';
import 'package:bazarly_app/features/cart/data/repos/cart_repo.dart';
import 'package:dartz/dartz.dart';

class CartRepoImpl implements CartRepo {
  final ApiConsumer apiConsumer;

  CartRepoImpl({required this.apiConsumer});

  @override
  Future<Either<String, String>> addToCart({required String productId}) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.addToCart,
        data: {ApiKeys.productId: productId},
      );
      var message = response[ApiKeys.message];

      return Right(message);
    } on ApiException catch (e) {
      return Left(e.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, UserCartResponse>> fetchUserCart() async {
    try {
      final response = await apiConsumer.get(EndPoints.getUserCart);
      var result = UserCartResponse.fromJson(response);

      return Right(result);
    } on ApiException catch (e) {
      return Left(e.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> clearCart() async {
    try {
      await apiConsumer.delete(EndPoints.clearCart);
      String message = 'Cart cleared successfully';
      return Right(message);
    } on ApiException catch (e) {
      return Left(e.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> removeFromCart({
    required String productId,
  }) async {
    try {
      await apiConsumer.delete(EndPoints.removeFromCart(productId));
      String message = 'Product removed from cart successfully';

      return Right(message);
    } on ApiException catch (e) {
      return Left(e.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> updateCartItemQuantity({
    required String productId,
    required String quantity,
  }) async {
    try {
      await apiConsumer.put(
        EndPoints.updateCartItemQuantity(productId),
        data: {ApiKeys.quantity: quantity},
      );
      String message = 'Quantity updated successfully';
      return Right(message);
    } on ApiException catch (e) {
      return Left(e.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
