part of 'home_cubit.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final Data data;

  HomeLoaded(this.data);
}

class HomeLoading extends HomeState {
  final Data data;
  final bool initial;

  HomeLoading(
    this.data, {
    this.initial = false,
  });
}

class Error extends HomeState {
  final String? message;

  Error(this.message);
}
