import 'package:bazarly_app/core/utils/constants/api_keys.dart';
import 'package:equatable/equatable.dart';
import 'brand.dart';
import 'category.dart';
import 'subcategory.dart';

class ProductDetails extends Equatable {
  final int? sold;
  final List<String>? images;
  final List<Subcategory>? subcategory;
  final int? ratingsQuantity;
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final String? imageCover;
  final Category? category;
  final Brand? brand;
  final double? ratingsAverage;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ProductDetails({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
    sold: json[ApiKeys.sold] as int?,
    images: json[ApiKeys.images] as List<String>?,
    subcategory: (json[ApiKeys.subcategory] as List<dynamic>?)
        ?.map((e) => Subcategory.fromJson(e as Map<String, dynamic>))
        .toList(),
    ratingsQuantity: json[ApiKeys.ratingsQuantity] as int?,
    id: json[ApiKeys.id] as String?,
    title: json[ApiKeys.title] as String?,
    slug: json[ApiKeys.slug] as String?,
    description: json[ApiKeys.description] as String?,
    quantity: json[ApiKeys.quantity] as int?,
    price: json[ApiKeys.price] as int?,
    imageCover: json[ApiKeys.imageCover] as String?,
    category: json[ApiKeys.category] == null
        ? null
        : Category.fromJson(json[ApiKeys.category] as Map<String, dynamic>),
    brand: json[ApiKeys.brand] == null
        ? null
        : Brand.fromJson(json[ApiKeys.brand] as Map<String, dynamic>),
    ratingsAverage: (json[ApiKeys.ratingsAverage] as num?)?.toDouble(),
    createdAt: json[ApiKeys.createdAt] == null
        ? null
        : DateTime.parse(json[ApiKeys.createdAt] as String),
    updatedAt: json[ApiKeys.updatedAt] == null
        ? null
        : DateTime.parse(json[ApiKeys.updatedAt] as String),
  );

  Map<String, dynamic> toJson() => {
    ApiKeys.sold: sold,
    ApiKeys.images: images,
    ApiKeys.subcategory: subcategory?.map((e) => e.toJson()).toList(),
    ApiKeys.ratingsQuantity: ratingsQuantity,
    ApiKeys.id: id,
    ApiKeys.title: title,
    ApiKeys.slug: slug,
    ApiKeys.description: description,
    ApiKeys.quantity: quantity,
    ApiKeys.price: price,
    ApiKeys.imageCover: imageCover,
    ApiKeys.category: category?.toJson(),
    ApiKeys.brand: brand?.toJson(),
    ApiKeys.ratingsAverage: ratingsAverage,
    ApiKeys.createdAt: createdAt?.toIso8601String(),
    ApiKeys.updatedAt: updatedAt?.toIso8601String(),
  };

  @override
  List<Object?> get props {
    return [
      sold,
      images,
      subcategory,
      ratingsQuantity,
      id,
      title,
      slug,
      description,
      quantity,
      price,
      imageCover,
      category,
      brand,
      ratingsAverage,
      createdAt,
      updatedAt,
    ];
  }
}
