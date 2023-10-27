
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entity/product_entity.dart';
import '../repository/product_repo.dart';

class SearchProductByName extends UsecaseWithParams<List<Product>, String>{
  const SearchProductByName(this._repo);
  final ProductRepo _repo;
  
  @override
  Future<Either<Failure, List<Product>>> call(String param) => _repo.searchProductByName(param);
  
}