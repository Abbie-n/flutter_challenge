import 'package:dartz/dartz.dart';
import 'package:flutter_challenge/core/errors/failure.dart';
import 'package:flutter_challenge/features/home/data/models/data_request_model.dart';
import 'package:flutter_challenge/features/home/domain/entities/data.dart';

abstract class DataRepository {
  Future<Either<Failure, Data>> getData(DataRequestModel model);
}
