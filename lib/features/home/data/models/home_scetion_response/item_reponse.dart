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
    id: json['_id'] as String?,
    name: json['name'] as String?,
    slug: json['slug'] as String?,
    image: json['image'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'slug': slug,
    'image': image,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };

  @override
  List<Object?> get props {
    return [id, name, slug, image, createdAt, updatedAt];
  }
}
