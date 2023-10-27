
import 'package:dartz/dartz.dart';
import 'package:technaureus_task/core/errors/failures.dart';
import 'package:technaureus_task/core/usecases/usecases.dart';
import 'package:technaureus_task/src/customers/domain/entity/customer.dart';
import 'package:technaureus_task/src/customers/domain/repository/customer_repo.dart';

class GetOneCustomer extends UsecaseWithParams<Customer, int>{
  GetOneCustomer(this._repo);

  final CustomerRepo _repo;
  
  @override
  Future<Either<Failure, Customer>> call(int param) => _repo.getOneCustomer(param);
}