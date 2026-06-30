import 'package:bazarly_app/features/product/data/models/products_response/product_details.dart';
import 'package:bazarly_app/features/product/data/models/products_response/products_response.dart';
import 'package:bazarly_app/features/product/data/repos/product_repo.dart';
import 'package:bazarly_app/features/product/presentation/view_models/products_fetch_cubit/product_fetch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductFetchCubit extends Cubit<ProductFetchState> {
  final ProductRepo productRepo;

  ProductFetchCubit(this.productRepo) : super(ProductInitial());

  // ─── Pagination state ─────────────────────────────────────

  /// Accumulates all fetched products across pages
  List<ProductDetails> products = [];

  /// The current page being displayed
  int currentPage = 1;
  bool isLoadingMore = false;
  bool hasNextPage = true;
  ProductsResponse? allResponse;

  // ─── Fetch All Products ───────────────────────────────────

  Future<void> fetchAllProducts({int page = 1, int limit = 10}) async {
    /// Show full-screen loading ONLY on first page
    if (page == 1) {
      emit(ProductsFetchLoading());
    }

    if (page > 1) {
      isLoadingMore = true;
      emit(
      ProductsFetchSuccess(
        response: allResponse!,
        isLoadingMore: true,
      ),
    );
    }
    var result = await productRepo.fetchAllProducts(page: page, limit: limit);

    result.fold(
      (failure) {
        // Stop Pagination Loader
        isLoadingMore = false;
        emit(ProductsFetchFailure(failure));
      },
      //Success
      (data) {
        /// Update current page number
        currentPage = data.paginationData?.currentPage ?? page;

        /// check if Api still has more pages
        hasNextPage =
            (data.paginationData?.currentPage ?? 1) <
            (data.paginationData?.numberOfPages ?? 1);

        if (page == 1) {
          products = data.data ?? [];
        }
        /// Append new page items to old list
        else {
          products.addAll(data.data ?? []);
        }

        /// Create updated response
        final updatedData = ProductsResponse(
          results: data.results,
          paginationData: data.paginationData,
          data: products,
        );

        /// Save latest successful response
        allResponse = updatedData;

        /// Stop bottom loading indicator
        isLoadingMore = false;

        /// Emit updated UI
        emit(
          ProductsFetchSuccess(
            response: updatedData,
            isLoadingMore: isLoadingMore,

          ),
        );
      },
    );
  }

  // ─── Fetch Product Details ────────────────────────────────

  /// Fetches the full details of a single product by [productId].
  Future<void> fetchProductDetails({required String productId}) async {
    emit(ProductDetailsFetchLoading());

    var result = await productRepo.fetchProductDetails(productId: productId);

    result.fold(
      (failure) => emit(ProductDetailsFetchFailure(failure)),
      (product) => emit(ProductDetailsFetchSuccess(product)),
    );
  }
}
