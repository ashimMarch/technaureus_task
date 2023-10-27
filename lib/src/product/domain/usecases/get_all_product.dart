
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entity/product_entity.dart';
import '../repository/product_repo.dart';

class GetAllProduct extends UsecaseWithoutParam<List<Product>>{
  const GetAllProduct(this._repo);
  final ProductRepo _repo;
  
  @override
  Future<Either<Failure, List<Product>>> call() => _repo.getAllProducts();
}