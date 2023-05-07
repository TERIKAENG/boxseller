import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Customer {
  String? id;
  String name;
  String tel;
  String address;
  // DateTime timestamp;

  Customer({
    required this.name,
    required this.tel,
    required this.address,
    // required this.timestamp,
  });

  CollectionReference customers =
      FirebaseFirestore.instance.collection('customers');
  Future<void> newCustomer() {
    // Call the user's CollectionReference to add a new user
    return customers
        .add({
          'name': name,
          'tel': tel,
          'address': address,
          // 'timestamp': timestamp
        })
        .then((value) => print("Order Added"))
        .catchError((error) => print("Failed to add Order: $error"));
  }

  Future<void> updateCustomer() async {
    // Call the user's CollectionReference to add a new user
    customers
        .doc(id)
        .update({
          'name': name,
          'tel': tel,
          'address': address,
          // 'timestamp': timestamp
        })
        .then((value) => print("Order Added"))
        .catchError((error) => print("Failed to add Order: $error"));
  }

  Customer copyWith({
    String? name,
    String? tel,
    String? address,
    // DateTime? timestamp,
  }) {
    return Customer(
      name: name ?? this.name,
      tel: tel ?? this.tel,
      address: address ?? this.address,
      // timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'tel': tel,
      'address': address,
      // 'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      name: map['name'] ?? '',
      tel: map['tel'] ?? '',
      address: map['address'] ?? '',
      //timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) =>
      Customer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Customer(name: $name, tel: $tel, address: $address, )';
  }
}
