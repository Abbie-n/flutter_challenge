import 'package:dartz/dartz.dart';
import 'package:flutter_challenge/core/errors/failure.dart';
import 'package:flutter_challenge/core/usescases/usecase.dart';
import 'package:flutter_challenge/features/home/data/models/data_request_model.dart';
import 'package:flutter_challenge/features/home/domain/entities/data.dart';
import 'package:flutter_challenge/features/home/domain/repositories/data_repository.dart';

class GetDataUseCase implements UseCase<Data, DataRequestModel> {
  final DataRepository repository;

  GetDataUseCase(this.repository);

  @override
  Future<Either<Failure, Data>> call(DataRequestModel params) async {
    return await repository.getData(params);
  }
}
