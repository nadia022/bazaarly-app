import 'package:equatable/equatable.dart';

import 'item_reponse.dart';
import 'pagination_data.dart';

class HomeScetionResponse extends Equatable {
  final int? results;
  final PaginationData? metadata;
  final List<ItemResponse>? data;

  const HomeScetionResponse({this.results, this.metadata, this.data});

  factory HomeScetionResponse.fromJson(Map<String, dynamic> json) {
    return HomeScetionResponse(
      results: json['results'] as int?,
      metadata: json['metadata'] == null
          ? null
          : PaginationData.fromJson(json['metadata'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'results': results,
    'metadata': metadata?.toJson(),
    'data': data?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [results, metadata, data];
}
