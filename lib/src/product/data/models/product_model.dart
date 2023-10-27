import 'package:technaureus_task/src/product/domain/entity/product_entity.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id, 
    required super.name, 
    required super.image, 
    required super.price, 
    required super.createdDate,
  });
  

  ProductModel.fromMap(Map<String, dynamic> map) : this(
    id: map['id'] as int,
    name: map['name'] as String,
    image: map['image'] as String,
    price: map['price'] as int,
    createdDate: map['created_date'] as String,
  );

  ProductModel copyWith({
    int? id,
    String? name,
    String? image,
    int? price,
    String? createdDate,
  }){
    return ProductModel(
      id: id ?? this.id, 
      name: name ?? this.name, 
      image: image ?? this.image, 
      price: price ?? this.price, 
      createdDate: createdDate ?? this.createdDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'created_date': createdDate,
    };
  }
}