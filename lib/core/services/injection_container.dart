import 'package:get_it/get_it.dart';
import 'package:technaureus_task/src/customers/data/datasource/customer_remote_data_src.dart';
import 'package:technaureus_task/src/customers/data/repository/customer_repo_imple.dart';
import 'package:technaureus_task/src/customers/domain/repository/customer_repo.dart';
import 'package:technaureus_task/src/customers/domain/usecases/create_customer.dart';
import 'package:technaureus_task/src/customers/domain/usecases/get_all_customer.dart';
import 'package:technaureus_task/src/customers/domain/usecases/get_one_customer.dart';
import 'package:technaureus_task/src/customers/domain/usecases/search_customer.dart';
import 'package:technaureus_task/src/customers/domain/usecases/update_customer.dart';
import 'package:technaureus_task/src/customers/presentation/bloc/customer_bloc.dart';
import 'package:technaureus_task/src/product/data/datasources/product_remote_data_source.dart';
import 'package:technaureus_task/src/product/data/repository/product_repo_impl.dart';
import 'package:technaureus_task/src/product/domain/usecases/get_all_product.dart';
import 'package:technaureus_task/src/product/domain/usecases/get_one_product.dart';
import 'package:technaureus_task/src/product/domain/usecases/search_product_by_name.dart';
import 'package:technaureus_task/src/product/presentation/bloc/product_bloc.dart';

import '../../src/product/domain/repository/product_repo.dart';

part 'injection_container_main.dart';