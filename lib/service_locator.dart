import 'package:flutter_challenge/core/utils/network/dio_client.dart';
import 'package:flutter_challenge/core/utils/network/logging.dart';
import 'package:flutter_challenge/features/home/data/datasources/remote_data_source.dart';
import 'package:flutter_challenge/features/home/data/repositories/data_repository_impl.dart';
import 'package:flutter_challenge/features/home/domain/repositories/data_repository.dart';
import 'package:flutter_challenge/features/home/domain/usecases/get_data_use_case.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Use cases
  sl.registerLazySingleton(() => GetDataUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<DataRepository>(
    () => DataRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: sl(),
    ),
  );

  // External
  sl.registerLazySingleton(() => DioClient());
  sl.registerLazySingleton(() => Logging());
}
