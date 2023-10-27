
import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

abstract class UsecaseWithParams<Type, Param>{
  const UsecaseWithParams();
  Future<Either<Failure, Type>> call(Param param);
}

abstract class UsecaseWithoutParam<Type>{
  const UsecaseWithoutParam();
  Future<Either<Failure, Type>> call();
}