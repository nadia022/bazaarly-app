import 'package:equatable/equatable.dart';

class PaginationData extends Equatable {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;
  final int? nextPage;

  const PaginationData({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  factory PaginationData.fromJson(Map<String, dynamic> json) => PaginationData(
    currentPage: json['currentPage'] as int?,
    numberOfPages: json['numberOfPages'] as int?,
    limit: json['limit'] as int?,
    nextPage: json['nextPage'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'currentPage': currentPage,
    'numberOfPages': numberOfPages,
    'limit': limit,
    'nextPage': nextPage,
  };

  @override
  List<Object?> get props {
    return [currentPage, numberOfPages, limit, nextPage];
  }
}
