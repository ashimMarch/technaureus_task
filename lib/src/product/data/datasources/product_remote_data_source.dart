import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:technaureus_task/core/errors/exceptions.dart';
import 'package:technaureus_task/src/product/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  const ProductRemoteDataSource();
  Future<List<ProductModel>> getAllProducts();

  Future<ProductModel> getOneProduct(int id);

  Future<List<ProductModel>> searchProductByName(String productName);
}

const _producturl = 'http://62.72.44.247/api/products/';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  const ProductRemoteDataSourceImpl();
  @override
  Future<List<ProductModel>> getAllProducts() async{
          // 'Accept': 'application/json',
    try {
      final response = await get(
        Uri.parse(_producturl),
        headers: {
          'Content-Type': 'application/json'
        },
      );
      if (response.statusCode != 200) {
        throw ServerException(message: response.body, statusCode: response.statusCode);
      }
      final products = jsonDecode(response.body)['data'] as List;
      return products.map((map) => ProductModel.fromMap(map)).toList();
    } on ServerException {
      rethrow;
    } catch(e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<ProductModel> getOneProduct(int id) async {
    try {
      final response = await get(
        Uri.parse('$_producturl?id=$id'),
        headers: {
          'Content-Type': 'application/json'
        }
      );
      if (response.statusCode != 200) {
        throw ServerException(message: response.body, statusCode: response.statusCode);
      }
      final product = jsonDecode(response.body)['data'];
      return ProductModel.fromMap(product);
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }
  
  @override
  Future<List<ProductModel>> searchProductByName(String productName) async{
    try {
      final response = await get(
        Uri.parse('$_producturl?search_query=$productName'),
        headers: {
          'Content-Type': 'application/json',
        }
      );
      if (response.statusCode != 200) {
        throw ServerException(message: response.body, statusCode: response.statusCode);
      }
      final products = jsonDecode(response.body)['data'] as List;
      return products.map((map) => ProductModel.fromMap(map)).toList();
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }
}