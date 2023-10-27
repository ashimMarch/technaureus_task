
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus_task/src/product/domain/entity/product_entity.dart';
import 'package:technaureus_task/src/product/domain/usecases/get_all_product.dart';
import 'package:technaureus_task/src/product/domain/usecases/search_product_by_name.dart';
import '../../domain/usecases/get_one_product.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({
    required GetAllProduct getAllProduct,
    required GetOneProduct getOneProduct,
    required SearchProductByName searchProduct,
  }) :
    _getAllProduct = getAllProduct,
    _getOneProduct = getOneProduct,
    _searchProduct = searchProduct,
  super(const ProductInitial()) {
    on<GetAllProductEvent>(_getAllProductEvent);
    on<GetOneProductEvent>(_getOneProductEvent);
    on<SearchProductEvent>(_searchProductEvent);
  }
  
  final GetAllProduct _getAllProduct;
  final GetOneProduct _getOneProduct;
  final SearchProductByName _searchProduct;

  FutureOr<void> _getAllProductEvent(GetAllProductEvent event, Emitter<ProductState> emit) async{
    emit(const ProductLoading());
    final result = await _getAllProduct();
    result.fold(
      (failure) => emit(ProductError(failure.errorMessage)), 
      (products) => emit(ProductLoaded(products)),
    );
  }

  FutureOr<void> _getOneProductEvent(GetOneProductEvent event, Emitter<ProductState> emit) async{
    emit(const ProductLoading());
    final result = await _getOneProduct(event.productId);
    result.fold(
      (failure) => emit(ProductError(failure.errorMessage)), 
      (products) => emit(ProductLoaded([products])),
    );
  }

  FutureOr<void> _searchProductEvent(SearchProductEvent event, Emitter<ProductState> emit) async{
    emit(const ProductSearching());
    final result = await _searchProduct(event.productName);
    result.fold(
      (failure) => emit(ProductError(failure.errorMessage)), 
      (products) => emit(ProductSearchCompleted(products)),
    );
  }
}
