import 'package:bazarly_app/features/product/data/models/products_response/product_details.dart';
import 'package:bazarly_app/features/product/data/models/products_response/products_response.dart';
import 'package:flutter/material.dart';

@immutable
sealed class ProductFetchState {}

/// Initial state before any data fetching begins.
final class ProductInitial extends ProductFetchState {}

// ─── Fetch All Products (with pagination) ────────────────────

/// Emitted on the first page load (list is empty).
final class ProductsFetchLoading extends ProductFetchState {}

/// Emitted when fetching more pages (list already has data).
/// Used to show a bottom loader without clearing the existing list.
final class ProductsFetchLoadingMore extends ProductFetchState {}

/// Emitted when a page of products is successfully loaded.
final class ProductsFetchSuccess extends ProductFetchState {
  ProductsResponse response;
  bool isLoadingMore;
  ProductsFetchSuccess({required this.response, this.isLoadingMore = false});
}

/// Emitted when fetching the products list fails.
final class ProductsFetchFailure extends ProductFetchState {
  final String errMessage;
  ProductsFetchFailure(this.errMessage);
}

// ─── Fetch Product Details ────────────────────────────────────

/// Emitted while loading a single product's details.
final class ProductDetailsFetchLoading extends ProductFetchState {}

/// Emitted when the product details are successfully loaded.
final class ProductDetailsFetchSuccess extends ProductFetchState {
  final ProductDetails product;
  ProductDetailsFetchSuccess(this.product);
}

/// Emitted when fetching product details fails.
final class ProductDetailsFetchFailure extends ProductFetchState {
  final String errMessage;
  ProductDetailsFetchFailure(this.errMessage);
}
