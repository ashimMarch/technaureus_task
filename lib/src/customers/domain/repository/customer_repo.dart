
import 'package:dartz/dartz.dart';
import 'package:technaureus_task/core/errors/failures.dart';
import 'package:technaureus_task/src/customers/domain/entity/customer.dart';
import 'package:technaureus_task/src/customers/domain/repository/customer_params.dart';

abstract class CustomerRepo {
  const CustomerRepo();
  Future<Either<Failure, List<Customer>>> getAllCustomer();
  
  Future<Either<Failure, Customer>> getOneCustomer(int id);

  Future<Either<Failure, List<Customer>>> searchCutomer(String name);

  Future<Either<Failure, Customer>> createCutomer({
    required CustomerParams params,
  });

  Future<Either<Failure, Customer>> updateCutomer({
    required CustomerParams params,
  });
}
