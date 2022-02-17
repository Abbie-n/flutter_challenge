import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({this.message});
  final String? message;

  @override
  String toString() => message!;

  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure(
      {final String? message =
          'Oooops! Something went wrong. Please try again'})
      : super(message: message);
}

class BadRequestFailure extends Failure {
  const BadRequestFailure({final String? message = 'An error occured...'})
      : super(message: message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(
      {final String? message =
          'Please check your internet connection and try again'})
      : super(message: message);
}
