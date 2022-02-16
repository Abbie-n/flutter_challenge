import 'package:dartz/dartz.dart';
import 'package:flutter_challenge/core/errors/failure.dart';
import 'package:flutter_challenge/features/home/data/datasources/remote_data_source.dart';
import 'package:flutter_challenge/features/home/data/models/data_request_model.dart';
import 'package:flutter_challenge/features/home/domain/entities/data.dart';
import 'package:flutter_challenge/features/home/domain/repositories/data_repository.dart';

class DataRepositoryImpl implements DataRepository {
  RemoteDataSource remoteDataSource;

  DataRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Data>> getData(DataRequestModel model) async {
    try {
      final remoteData = await remoteDataSource.getData(model);

      return Right(remoteData);
    } on Exception {
      return const Left(BadRequestFailure());
    }
  }
}
