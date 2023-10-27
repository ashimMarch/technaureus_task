import 'package:dartz/dartz.dart';
import 'package:technaureus_task/core/errors/exceptions.dart';
import 'package:technaureus_task/core/errors/failures.dart';
import 'package:technaureus_task/src/product/domain/entity/product_entity.dart';
import '../../domain/repository/product_repo.dart';
import '../datasources/product_remote_data_source.dart';

class ProductRepoImpl implements ProductRepo{
  const ProductRepoImpl(this._dataSource);

  final ProductRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async{
    try {
      final result = await _dataSource.getAllProducts();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, Product>> getOneProduct(int id) async {
    try {
      final result = await _dataSource.getOneProduct(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> searchProductByName(String productName) async {
    try {
      final result = await _dataSource.searchProductByName(productName);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
  
}