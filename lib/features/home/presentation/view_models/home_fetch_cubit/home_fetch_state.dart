import 'package:bazarly_app/features/home/data/models/home_scetion_response/item_reponse.dart';
import 'package:flutter/material.dart';


@immutable
sealed class HomeFetchState {}

/// Initial state before any data fetching begins.
final class HomeInitial extends HomeFetchState{}

// --- Gategories List Section ---

/// Emitted when the system is fetching the list of categories from the network (and cache is empty).
final class GategoriesFetchLoading extends HomeFetchState {}

/// Emitted when the categiries list is successfully retrieved.
final class GategoriesFetchSuccess extends HomeFetchState {
  final List<ItemResponse> gategories;
  GategoriesFetchSuccess(this.gategories);
}

/// Emitted when an error occurs while fetching the categories list.
final class GategoriesFetchFailure extends HomeFetchState {
  final String errMessage;
  GategoriesFetchFailure(this.errMessage);
}

// --- Brands list Section ---

/// Base state for brands list.
sealed class BrandsListState extends HomeFetchState {}

/// Emitted while loading full brands list.
final class BrandsFetchLoading extends BrandsListState {}

/// Emitted when specific brands list are successfully loaded.
final class BrandsFetchSuccess extends BrandsListState {
  final List< ItemResponse> brands;
  BrandsFetchSuccess(this.brands);
}

/// Emitted when fetching list of brands fails.
final class BrandsFetchFailure extends BrandsListState {
  final String errMessage;
  BrandsFetchFailure(this.errMessage);
}
