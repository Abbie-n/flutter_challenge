import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_challenge/core/errors/failure.dart';
import 'package:flutter_challenge/features/home/data/models/data_request_model.dart';
import 'package:flutter_challenge/features/home/domain/usecases/get_data_use_case.dart';
import 'package:meta/meta.dart';
import 'package:flutter_challenge/features/home/domain/entities/data.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.getData}) : super(HomeInitial());

  DataRequestModel model = DataRequestModel();

  final GetDataUseCase getData;

  void loadData() {
    if (state is HomeLoading) return;
    final currentState = state;
    var initialData = const Data();
    if (currentState is HomeLoaded) {
      initialData = currentState.data;
    }
    emit(HomeLoading(initialData, initial: model.limit == 10));
    getData(model).then((newData) {
      model.limit = model.limit! + 10;
      print('Limit: ${model.limit}');
      newData.fold(
        (failure) => emit(Error(_mapFailureToMessage(failure))),
        (res) => emit(HomeLoaded(res)),
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkFailure:
        return const NetworkFailure().message!;
      case BadRequestFailure:
        return const BadRequestFailure().message!;
      default:
        return const ServerFailure().message!;
    }
  }
}
