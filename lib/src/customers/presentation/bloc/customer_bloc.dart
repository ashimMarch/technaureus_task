import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus_task/src/customers/domain/entity/customer.dart';
import 'package:technaureus_task/src/customers/domain/usecases/create_customer.dart';
import 'package:technaureus_task/src/customers/domain/usecases/get_all_customer.dart';
import 'package:technaureus_task/src/customers/domain/usecases/get_one_customer.dart';
import 'package:technaureus_task/src/customers/domain/usecases/search_customer.dart';
import 'package:technaureus_task/src/customers/domain/usecases/update_customer.dart';

import '../../domain/repository/customer_params.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerBloc({
    required CreateCustomer createCustomer,
    required GetAllCustomer getAllCustomer,
    required GetOneCustomer getOneCustomer,
    required SearchCustomer searchCustomer,
    required UpdateCustomer updateCustomer,
  }) : 
    _createCustomer = createCustomer,
    _getAllCustomer = getAllCustomer,
    _getOneCustomer = getOneCustomer,
    _searchCustomer = searchCustomer,
    _updateCustomer = updateCustomer,
  super(const CustomerInitial()) {
    on<CreateCustomerEvent>(_createCustomerEvent);
    on<GetAllCustomerEvent>(_getAllCustomerEvent);
    on<GetOneCustomerEvent>(_getOneCustomerEvent);
    on<SearchCustomerEvent>(_searchCustomerEvent);
    on<UpdateCustomerEvent>(_updateCustomerEvent);
  }

  final CreateCustomer _createCustomer;
  final GetAllCustomer _getAllCustomer;
  final GetOneCustomer _getOneCustomer;
  final SearchCustomer _searchCustomer;
  final UpdateCustomer _updateCustomer;


  FutureOr<void> _createCustomerEvent(CreateCustomerEvent event, Emitter<CustomerState> emit) async{
    emit(const CustomerUploading());
    final result = await _createCustomer(event.customerInfo);
    result.fold(
      (failure) => emit(CustomerError(failure.errorMessage)), 
      (customer) => emit(CustomerCreated(customer)),
    );
  }
  
  FutureOr<void> _getAllCustomerEvent(GetAllCustomerEvent event, Emitter<CustomerState> emit) async{
    emit(const CustomerLoading());
    final result = await _getAllCustomer();
    result.fold(
      (failure) => emit(CustomerError(failure.errorMessage)), 
      (customers) => emit(CustomerLoaded(customers)),
    );
  }

  FutureOr<void> _getOneCustomerEvent(GetOneCustomerEvent event, Emitter<CustomerState> emit) async{
    emit(const CustomerLoading());    
    final result = await _getOneCustomer(event.id);
    result.fold(
      (failure) => emit(CustomerError(failure.errorMessage)), 
      (customer) => emit(CustomerLoaded([customer])),
    );
  }

  FutureOr<void> _searchCustomerEvent(SearchCustomerEvent event, Emitter<CustomerState> emit) async{
    emit(const CustomerSearching());
    final result = await _searchCustomer(event.name);
    result.fold(
      (failure) => emit(CustomerError(failure.errorMessage)), 
      (customers) => emit(SearchingCompleted(customers)),
    );
  }

  FutureOr<void> _updateCustomerEvent(UpdateCustomerEvent event, Emitter<CustomerState> emit) async{
    emit(const CustomerUploading());
    final result = await _updateCustomer(event.customerInfo);
    result.fold(
      (failure) => emit(CustomerError(failure.errorMessage)), 
      (customer) => emit(CustomerUpdated(customer)),
    );
  }
}
