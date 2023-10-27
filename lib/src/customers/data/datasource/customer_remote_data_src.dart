
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:technaureus_task/core/errors/exceptions.dart';
import 'package:technaureus_task/src/customers/data/models/customer_model.dart';
import 'package:technaureus_task/src/customers/domain/repository/customer_params.dart';

abstract class CustomerRemoteDataSrc {
  const CustomerRemoteDataSrc();
  Future<List<CustomerModel>> getAllCustomer();

  Future<CustomerModel> getOneCustomer(int id);

  Future<List<CustomerModel>> searchCustomer(String name);

  Future<CustomerModel> createCutomer(CustomerParams params);

  Future<CustomerModel> updateCutomer(CustomerParams params);
}

const _customerUrl = 'http://62.72.44.247/api/customers/';

class CustomerRemoteDataSrcImpl extends CustomerRemoteDataSrc{
  const CustomerRemoteDataSrcImpl();

  @override
  Future<CustomerModel> createCutomer(CustomerParams params) async {
    try {
      final response = await _uploadData(
        method: 'POST',
        params: params,
        url: _customerUrl,
      );
      if (response.statusCode != 200) {
      print(response.body);
        throw ServerException(message: response.body, statusCode: response.statusCode);
      }
      final customer = jsonDecode(response.body)['data'];
      return CustomerModel.fromMap(customer);
    } on ServerException {
      rethrow;
    } catch(e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<CustomerModel>> getAllCustomer() async {
    try {
      final response = await get(
        Uri.parse(_customerUrl),
        headers: {
          'Content-Type': 'application/json'
        },
      );
      if (response.statusCode != 200) {
        throw ServerException(message: response.body, statusCode: response.statusCode);
      }
      final customers = jsonDecode(response.body)['data'] as List;
      return customers.map((map) => CustomerModel.fromMap(map)).toList();
    } on ServerException {
      rethrow;
    } catch(e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<CustomerModel> getOneCustomer(int id) async {
    try {
      final response = await get(
        Uri.parse('$_customerUrl?id=$id'),
        headers: {
          'Content-Type': 'application/json'
        }
      );
      if (response.statusCode != 200) {
        throw ServerException(message: response.body, statusCode: response.statusCode);
      }
      final customer = jsonDecode(response.body)['data'];
      return CustomerModel.fromMap(customer);
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<List<CustomerModel>> searchCustomer(String name) async {
    try {
      final response = await get(
        Uri.parse('$_customerUrl?search_query=$name'),
        headers: {
          'Content-Type': 'application/json'
        },
      );
      if (response.statusCode != 200) {
        throw ServerException(message: response.body, statusCode: response.statusCode);
      }
      final customers = jsonDecode(response.body)['data'] as List;
      return customers.map((map) => CustomerModel.fromMap(map)).toList();
    } on ServerException {
      rethrow;
    } catch(e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<CustomerModel> updateCutomer(CustomerParams params) async {
    try {
      final response = await _uploadData(
        method: 'PUT',
        params: params,
        url: '$_customerUrl?id=${params.id}',
      );
      if (response.statusCode != 200) {
        throw ServerException(message: response.body, statusCode: response.statusCode);
      }
      final customer = jsonDecode(response.body)['data'];
      return CustomerModel.fromMap(customer);
    } on ServerException {
      rethrow;
    } catch(e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }
  
  Future<Response> _uploadData({
    required CustomerParams params,
    required String url,
    required String method,
  }) async {
    final input = <String, String>{
        'name': params.name,
        'mobile_number': params.mobileNumber,
        'email': params.email,
        'street': params.street,
        'street_two': params.streetTwo,
        'city': params.city,
        'pincode': params.pincode.toString(),
        'country': params.country,
        'state': params.state,
      };
      final request = MultipartRequest(method, Uri.parse(url));
      request.fields.addAll(input);
      if (params.profilePic != null) {
        request.files.add(MultipartFile.fromBytes(
          'profile_pic', 
          File(params.profilePic!.path).readAsBytesSync(),
          filename: params.profilePic!.path)
        );
      }
      final streamedResponse = await request.send();
      return await Response.fromStream(streamedResponse);
  }

}