
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entity/product_entity.dart';
import '../repository/product_repo.dart';

class GetOneProduct extends UsecaseWithParams<Product, int>{
  const GetOneProduct(this._repo);
  final ProductRepo _repo;
  
  @override
  Future<Either<Failure, Product>> call(int param) => _repo.getOneProduct(param);
  
}