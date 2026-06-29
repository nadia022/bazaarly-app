import 'package:bazarly_app/core/utils/constants/api_keys.dart';
import 'package:equatable/equatable.dart';
import 'item_reponse.dart';
import '../../../../../core/models/pagination_data.dart';

class HomeScetionResponse extends Equatable {
  final int? results;
  final PaginationData? metadata;
  final List<ItemResponse>? data;

  const HomeScetionResponse({this.results, this.metadata, this.data});

  factory HomeScetionResponse.fromJson(Map<String, dynamic> json) {
    return HomeScetionResponse(
      results: json[ApiKeys.results] as int?,
      metadata: json[ApiKeys.metaData] == null
          ? null
          : PaginationData.fromJson(json[ApiKeys.metaData] as Map<String, dynamic>),
      data: (json[ApiKeys.data] as List<dynamic>?)
          ?.map((e) => ItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    ApiKeys.results: results,
    ApiKeys.metaData: metadata?.toJson(),
    ApiKeys.data: data?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [results, metadata, data];
}
