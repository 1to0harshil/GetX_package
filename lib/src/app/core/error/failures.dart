import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

// General failures
class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ApiFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class SessionFailure extends Failure {
  @override
  List<Object?> get props => [];
}
