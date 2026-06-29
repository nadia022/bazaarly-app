import 'package:bazarly_app/core/models/pagination_data.dart';
import 'package:equatable/equatable.dart';
import 'product_details.dart';

class ProductsResponse extends Equatable {
  final int? results;
  final PaginationData? paginationData;
  final List<ProductDetails>? data;

  const ProductsResponse({this.results, this.paginationData, this.data});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      results: json['results'] as int?,
      paginationData: json['metadata'] == null
          ? null
          : PaginationData.fromJson(json['metadata'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'results': results,
    'metadata': paginationData?.toJson(),
    'data': data?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [results, paginationData, data];
}
