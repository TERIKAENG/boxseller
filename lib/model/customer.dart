import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Customer {
  String name;
  String tel;
  String address;
  Customer({
    required this.name,
    required this.tel,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'tel': tel,
      'address': address,
    };
  }

  CollectionReference customers =
      FirebaseFirestore.instance.collection('customers');
  Future<void> newCustomer() {
    // Call the user's CollectionReference to add a new user
    return customers
        .add({
          'name': name,
          'tel': tel,
          'address': address,
        })
        .then((value) => print("Order Added"))
        .catchError((error) => print("Failed to add Order: $error"));
  }


  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      name: map['name'] as String,
      tel: map['tel'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) =>
      Customer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BoxOrder(name: $name, tel: $tel, address: $address)';

  Customer copyWith({
    String? name,
    String? tel,
    String? address,
  }) {
    return Customer(
      name: name ?? this.name,
      tel: tel ?? this.tel,
      address: address ?? this.address,
    );
  }
}
