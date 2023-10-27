
import 'package:technaureus_task/src/product/domain/entity/product_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';


abstract class ProductRepo {
  Future<Either<Failure, List<Product>>> getAllProducts();

  Future<Either<Failure, Product>> getOneProduct(int id);
  
  Future<Either<Failure, List<Product>>> searchProductByName(String productName);
}