
import 'package:equatable/equatable.dart';

class Customer extends Equatable {

  final int id;
  final String name;
  final String? profilePic;
  final String mobileNumber;
  final String email;
  final String street;
  final String streetTwo;
  final String city;
  final int pincode;
  final String country;
  final String state;
  final String createdDate;

  const Customer({
    required this.id, 
    required this.name, 
    required this.mobileNumber, 
    required this.email, 
    required this.street, 
    required this.streetTwo, 
    required this.city, 
    required this.pincode, 
    required this.country, 
    required this.state, 
    required this.createdDate,
    this.profilePic, 
  });
  

  @override
  List<Object?> get props => [id];
  
  @override
  String toString() {
    return 'Customer(id: $id, name: $name, profilePic: $profilePic, mobileNumber: $mobileNumber, '
    'email: $email, street: $street, streetTwo: $streetTwo, city: $city, pincode: $pincode, '
    'country: $country, state: $state, createdDate: $createdDate)';
  }
}
