part of 'customer_bloc.dart';

sealed class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  List<Object> get props => [];
}

final class GetAllCustomerEvent extends CustomerEvent {
  const GetAllCustomerEvent();
}

final class GetOneCustomerEvent extends CustomerEvent {
  const GetOneCustomerEvent({required this.id});
  final int id;
  
  @override
  List<int> get props => [id];
}

final class SearchCustomerEvent extends CustomerEvent {
  const SearchCustomerEvent(this.name);
  final String name;

  @override
  List<String> get props => [name];
}

final class CreateCustomerEvent extends CustomerEvent {
  const CreateCustomerEvent({required this.customerInfo});
  final CustomerParams customerInfo; 
}

final class UpdateCustomerEvent extends CustomerEvent {
  const UpdateCustomerEvent({required this.customerInfo});
  final CustomerParams customerInfo; 
}
