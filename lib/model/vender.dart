import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Vender {
  String? id;
  String name;
  String tel;
  String address;
  Vender({
    this.id,
    required this.name,
    required this.tel,
    required this.address,

  });

  Vender copyWith({
    String? id,
    String? name,
    String? tel,
    String? address,

  }) {
    return Vender(
      id: id ?? this.id,
      name: name ?? this.name,
      tel: tel ?? this.tel,
      address: address ?? this.address,

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tel': tel,
      'address': address,
    };
  }

  factory Vender.fromMap(Map<String, dynamic> map) {
    return Vender(
      id: map['id'],
      name: map['name'] ?? '',
      tel: map['tel'] ?? '',
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Vender.fromJson(String source) => Vender.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Vender(id: $id, name: $name, tel: $tel, address: $address)';
  }

  CollectionReference venders =
      FirebaseFirestore.instance.collection('venders');
  Future<void> newVender() {
    return venders
        .add({
          'name': name,
          'tel': tel,
          'address': address,
          // 'timestamp': timestamp
        })
        .then((value) => print("Order Added"))
        .catchError((error) => print("Failed to add Order: $error"));
  }

}
