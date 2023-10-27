

import 'dart:io';

import 'package:equatable/equatable.dart';

class CustomerParams extends Equatable{
  const CustomerParams({
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
    this.profilePic,
  });
  final int? id;
  final String name;
  final File? profilePic;
  final String mobileNumber;
  final String email;
  final String street;
  final String streetTwo;
  final String city;
  final int pincode;
  final String country;
  final String state;

  @override
  List<Object?> get props => [name, profilePic, mobileNumber, email, street, streetTwo, city, pincode, country, state];
  
}