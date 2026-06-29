import 'package:bazarly_app/core/utils/constants/api_keys.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  const Category({this.id, this.name, this.slug, this.image});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json[ApiKeys.id] as String?,
    name: json[ApiKeys.name] as String?,
    slug: json[ApiKeys.slug] as String?,
    image: json[ApiKeys.image] as String?,
  );

  Map<String, dynamic> toJson() => {
    ApiKeys.id: id,
    ApiKeys.name: name,
    ApiKeys.slug: slug,
    ApiKeys.image: image,
  };

  @override
  List<Object?> get props => [id, name, slug, image];
}
