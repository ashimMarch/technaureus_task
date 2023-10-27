part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await productInit();
  await customerInit();
}

Future<void> productInit() async{
  sl..registerFactory(() => ProductBloc(
      getAllProduct: sl(), 
      getOneProduct: sl(), 
      searchProduct: sl(),
    ))
  ..registerLazySingleton(() => GetAllProduct(sl()))
  ..registerLazySingleton(() => GetOneProduct(sl()))
  ..registerLazySingleton(() => SearchProductByName(sl()))
  ..registerLazySingleton<ProductRepo>(() => ProductRepoImpl(sl()))
  ..registerLazySingleton<ProductRemoteDataSource>(() => const ProductRemoteDataSourceImpl());
}

Future<void> customerInit() async{
  sl..registerFactory(() => CustomerBloc(
      createCustomer: sl(), getAllCustomer: sl(), 
      getOneCustomer: sl(), searchCustomer: sl(), 
      updateCustomer: sl(),
    ))
  ..registerLazySingleton(() => CreateCustomer(sl()))
  ..registerLazySingleton(() => GetAllCustomer(sl()))
  ..registerLazySingleton(() => GetOneCustomer(sl()))
  ..registerLazySingleton(() => SearchCustomer(sl()))
  ..registerLazySingleton(() => UpdateCustomer(sl()))
  ..registerLazySingleton<CustomerRepo>(() => CustomerRepoImpl(sl()))
  ..registerLazySingleton<CustomerRemoteDataSrc>(() => const CustomerRemoteDataSrcImpl());
}
