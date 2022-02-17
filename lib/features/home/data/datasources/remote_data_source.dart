import 'dart:convert';
import 'package:flutter_challenge/core/utils/network/dio_client.dart';
import 'package:flutter_challenge/features/home/data/models/data_model.dart';
import 'package:flutter_challenge/features/home/data/models/data_request_model.dart';

abstract class RemoteDataSource {
  Future<DataModel> getData(DataRequestModel model);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  DioClient client;

  RemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<DataModel> getData(DataRequestModel model) async {
    final response = await client.get(params: model.toJson());
    DataModel data = const DataModel();
    if (response != null) {
      data = DataModel.fromJson(response.data!);
      return data;
    } else {
      return data;
    }
  }
}
