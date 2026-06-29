import 'package:bazarly_app/core/errors/exceptions/api_exception.dart';
import 'package:bazarly_app/core/network/api_consumer.dart';
import 'package:bazarly_app/core/utils/constants/api_endpoints.dart';
import 'package:bazarly_app/features/product/data/models/products_response/product_details.dart';
import 'package:bazarly_app/features/product/data/repos/product_repo.dart';
import 'package:dartz/dartz.dart';

class ProductRepoImpl implements ProductRepo {
  final ApiConsumer apiConsumer;

  ProductRepoImpl({required this.apiConsumer});

  @override
  Future<Either<String, List<ProductDetails>>> fetchAllProducts({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      Map<String, dynamic> response = await apiConsumer.get(
        EndPoints.getAllProducts,
        // Passes pagination as query parameters: ?page=1&limit=10
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );

      // The API returns the products list inside the "data" key
      List<ProductDetails> products = (response['data'] as List)
          .map((e) => ProductDetails.fromJson(e))
          .toList();

      return Right(products);
    } on ApiException catch (e) {
      return Left(e.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ProductDetails>> fetchProductDetails({
    required String productId,
  }) async {
    try {
      Map<String, dynamic> response = await apiConsumer.get(
        // Appends the productId to the endpoint: /products/:productId
        '${EndPoints.getAllProducts}/$productId',
      );

      // The API returns the product object inside the "data" key
      final product = ProductDetails.fromJson(response['data']);

      return Right(product);
    } on ApiException catch (e) {
      return Left(e.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }
}