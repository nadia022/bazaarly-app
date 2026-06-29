import 'package:bazarly_app/features/product/data/models/products_response/product_details.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepo {
  /// Fetches a paginated list of all products.
  ///
 
  Future<Either<String, List<ProductDetails>>> fetchAllProducts({
    int page = 1,
    int limit = 10,
  });

  /// Fetches the full details of a single product by its [productId].
  ///
  Future<Either<String, ProductDetails>> fetchProductDetails({
    required String productId,
  });
}