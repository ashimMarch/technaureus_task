

import 'package:equatable/equatable.dart';

class Product extends Equatable{
  const Product({
    required this.id, 
    required this.name, 
    required this.image, 
    required this.price, 
    required this.createdDate
  });

  final int id;
  final String name;
  final String image;
  final int price;
  final String createdDate;

  @override
  List<Object?> get props => [id];
  
  @override
  String toString() {
    return 'ProductEntity(id: $id, name: $name, image: $image, price: $price, createdDate: $createdDate)';
  }
}