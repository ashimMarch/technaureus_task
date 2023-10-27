part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();
  
  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {
  const ProductInitial();
}

final class ProductLoading extends ProductState {
  const ProductLoading();
}

final class ProductSearching extends ProductState {
  const ProductSearching();
}

final class ProductSearchCompleted extends ProductState {
  const ProductSearchCompleted(this.products);

  final List<Product> products;
  @override
  List<Object> get props => [products];
}

final class ProductLoaded extends ProductState {
  const ProductLoaded(this.products);

  final List<Product> products;
  @override
  List<Object> get props => [products];
}

final class ProductError extends ProductState {
  const ProductError(this.message);

  final String message;
  @override
  List<String> get props => [message];
}
