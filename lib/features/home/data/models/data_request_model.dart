class DataRequestModel {
  final int? page;
  int? limit;

  DataRequestModel({
    this.page = 0,
    this.limit = 10,
  });

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'per_page': limit,
    };
  }
}
