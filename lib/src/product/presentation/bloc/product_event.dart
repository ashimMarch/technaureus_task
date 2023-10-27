part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

final class GetAllProductEvent extends ProductEvent {
  const GetAllProductEvent();
}

final class GetOneProductEvent extends ProductEvent {
  const GetOneProductEvent({required this.productId});

  final int productId;
  @override
  List<int> get props => [productId];
}

final class SearchProductEvent extends ProductEvent {
  const SearchProductEvent({required this.productName});

  final String productName;
  @override
  List<String> get props => [productName];
}