import 'package:dartz/dartz.dart';
import 'package:technaureus_task/core/errors/exceptions.dart';
import 'package:technaureus_task/core/errors/failures.dart';
import 'package:technaureus_task/src/customers/data/datasource/customer_remote_data_src.dart';
import 'package:technaureus_task/src/customers/domain/entity/customer.dart';
import 'package:technaureus_task/src/customers/domain/repository/customer_params.dart';
import 'package:technaureus_task/src/customers/domain/repository/customer_repo.dart';

class CustomerRepoImpl extends CustomerRepo{
  const CustomerRepoImpl(this._dataSource);
  
  final CustomerRemoteDataSrc _dataSource;
  @override
  Future<Either<Failure, Customer>> createCutomer({required CustomerParams params}) async {
    try {
      final result = await _dataSource.createCutomer(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<Customer>>> getAllCustomer() async {
    try {
      final result = await _dataSource.getAllCustomer();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, Customer>> getOneCustomer(int id) async {
    try {
      final result = await _dataSource.getOneCustomer(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<Customer>>> searchCutomer(String name) async {
    try {
      final result = await _dataSource.searchCustomer(name);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, Customer>> updateCutomer({required CustomerParams params}) async {
    try {
      final result = await _dataSource.updateCutomer(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
  
}