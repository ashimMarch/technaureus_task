
import 'package:technaureus_task/src/customers/domain/entity/customer.dart';

class CustomerModel extends Customer {
  const CustomerModel({
    required super.id, 
    required super.name, 
    required super.mobileNumber, 
    required super.email, 
    required super.street, 
    required super.streetTwo, 
    required super.city, 
    required super.pincode, 
    required super.country, 
    required super.state, 
    required super.createdDate,
    super.profilePic
  }); 

  CustomerModel.fromMap(Map<String, dynamic> map) : this(
    id: map['id'] as int,
    name: map['name'] as String,
    mobileNumber: map['mobile_number'] as String,
    email: map['email'] as String,
    street: map['street'] as String,
    streetTwo: map['street_two'] as String,
    city: map['city'] as String,
    pincode: map['pincode'] as int,
    country: map['country'] as String,
    state: map['state'] as String,
    createdDate: map['created_date'] as String,
    profilePic: map['profile_pic'] as String?,
  );

  CustomerModel copyWith({
    int? id,
    String? name,
    String? profilePic,
    String? mobileNumber,
    String? email,
    String? street,
    String? streetTwo,
    String? city,
    int? pincode,
    String? country,
    String? state,
    String? createdDate,
  }){
    return CustomerModel(
      id: id ?? this.id, 
      name: name ?? this.name,
      mobileNumber: mobileNumber ?? this.mobileNumber, 
      email: email ?? this.email, 
      street: street ?? this.street, 
      streetTwo: streetTwo ?? this.streetTwo, 
      city: city ?? this.city, 
      pincode: pincode ?? this.pincode, 
      country: country ?? this.country, 
      state: state ?? this.state, 
      profilePic: profilePic ?? this.profilePic, 
      createdDate: createdDate ?? this.createdDate,
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'mobile_number': mobileNumber,
      'email': email,
      'street': street,
      'street_two': streetTwo,
      'city': city,
      'pincode': pincode,
      'country': country,
      'state': state,
      'created_date': createdDate,
      'profile_pic': profilePic,
    };
  }
}
