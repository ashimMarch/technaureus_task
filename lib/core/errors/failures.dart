import 'package:equatable/equatable.dart';
import 'package:technaureus_task/core/errors/exceptions.dart';

abstract class Failure extends Equatable {
  const Failure({
    required this.message, required this.statusCode,
  });
  final String message;
  final int statusCode;

  String get errorMessage => 
        '$statusCode: $message';

  @override
  List<dynamic> get props => [message, statusCode];
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message, required super.statusCode,});
  
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, required super.statusCode,});
  
  ServerFailure.fromException(ServerException exception) 
      : this(message: exception.message, statusCode: exception.statusCode);
}
