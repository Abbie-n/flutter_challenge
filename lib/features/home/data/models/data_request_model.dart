import 'dart:convert';

class DataRequestModel {
  final String? page;
  final String? limit;

  DataRequestModel({
    this.page,
    this.limit,
  });

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'per_page': limit,
    };
  }
}
