part of 'customer_bloc.dart';

sealed class CustomerState extends Equatable {
  const CustomerState();
  
  @override
  List<Object> get props => [];
}

final class CustomerInitial extends CustomerState {
  const CustomerInitial();
}

final class CustomerLoading extends CustomerState {
  const CustomerLoading();
}

final class CustomerUploading extends CustomerState {
  const CustomerUploading();
}

final class CustomerSearching extends CustomerState {
  const CustomerSearching();
}

final class SearchingCompleted extends CustomerState {
  const SearchingCompleted(this.customers);
  
  final List<Customer> customers;
  @override
  List<Object> get props => [customers];
}

final class CustomerLoaded extends CustomerState {
  const CustomerLoaded(this.customers);

  final List<Customer> customers;
  @override
  List<Object> get props => [customers];
}

final class CustomerCreated extends CustomerState {
  const CustomerCreated(this.customer);

  final Customer customer;
  @override
  List<Object> get props => [customer];
}

final class CustomerUpdated extends CustomerState {
  const CustomerUpdated(this.customer);

  final Customer customer;
  @override
  List<Object> get props => [customer];
}

final class CustomerError extends CustomerState {
  const CustomerError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}
