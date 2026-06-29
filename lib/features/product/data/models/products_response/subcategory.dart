import 'package:bazarly_app/core/utils/constants/api_keys.dart';
import 'package:equatable/equatable.dart';

class Subcategory extends Equatable {
  final String? id;
  final String? name;
  final String? slug;
  final String? category;

  const Subcategory({
    this.id,
    this.name,
    this.slug,
    this.category,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        id: json[ApiKeys.id] as String?,
        name: json[ApiKeys.name] as String?,
        slug: json[ApiKeys.slug] as String?,
        category: json[ApiKeys.category] as String?,
      );

  Map<String, dynamic> toJson() => {
        ApiKeys.id: id,
        ApiKeys.name: name,
        ApiKeys.slug: slug,
        ApiKeys.category: category,
      };

  @override
  List<Object?> get props => [id, name, slug, category];
}