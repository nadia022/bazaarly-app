import 'package:bazarly_app/core/utils/constants/api_keys.dart';
import 'package:equatable/equatable.dart';

class ItemResponse extends Equatable {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ItemResponse({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory ItemResponse.fromJson(Map<String, dynamic> json) => ItemResponse(
    id: json[ApiKeys.id] as String?,
    name: json[ApiKeys.name] as String?,
    slug: json[ApiKeys.slug] as String?,
    image: json[ApiKeys.image] as String?,
    createdAt: json[ApiKeys.createdAt] == null
        ? null
        : DateTime.parse(json[ApiKeys.createdAt] as String),
    updatedAt: json[ApiKeys.updatedAt] == null
        ? null
        : DateTime.parse(json[ApiKeys.updatedAt] as String),
  );

  Map<String, dynamic> toJson() => {
    ApiKeys.id: id,
    ApiKeys.name: name,
    ApiKeys.slug: slug,
    ApiKeys.image: image,
    ApiKeys.createdAt: createdAt?.toIso8601String(),
    ApiKeys.updatedAt: updatedAt?.toIso8601String(),
  };

  @override
  List<Object?> get props {
    return [id, name, slug, image, createdAt, updatedAt];
  }
}
