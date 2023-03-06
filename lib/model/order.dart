import 'dart:convert';

import 'package:boxseller/model/calculateMat.dart';
import 'package:boxseller/model/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BoxOrder {
  String? id;
  String name;
  double weightProduct;
  double widthBox;
  double longBox;
  double heightBox;
  int unit;
  int orderAmount;
  int isHumidityProduct;
  int isHumidityWarehouse;
  bool amount_stack_warehouse;
  int useDesignService;
  int isSharpPrint;
  bool isUseColorOver;
  String artwork;
  int isDeliveryProduct;
  double widthTemplate;
  double heightTemplate;
  String empId;
  String status;
  String paper;
  String customer;
  String? ronType;
  Object? material;

  List<MaterialPaper>? materialCalculate = [];
  
  BoxOrder({
    this.id,
    required this.name,
    required this.weightProduct,
    required this.widthBox,
    required this.longBox,
    required this.heightBox,
    required this.unit,
    required this.orderAmount,
    required this.isHumidityProduct,
    required this.isHumidityWarehouse,
    required this.amount_stack_warehouse,
    required this.useDesignService,
    required this.isSharpPrint,
    required this.isUseColorOver,
    required this.artwork,
    required this.isDeliveryProduct,
    required this.widthTemplate,
    required this.heightTemplate,
    required this.empId,
    required this.status,
    required this.paper,
    required this.customer,
  });

  @override
  String toString() {
    return 'BoxOrder(id: $id, name: $name, weightProduct: $weightProduct, widthBox: $widthBox, longBox: $longBox, heightBox: $heightBox, unit: $unit, orderAmount: $orderAmount, isHumidityProduct: $isHumidityProduct, isHumidityWarehouse: $isHumidityWarehouse, amount_stack_warehouse: $amount_stack_warehouse, useDesignService: $useDesignService, isSharpPrint: $isSharpPrint, isUseColorOver: $isUseColorOver, artwork: $artwork, isDeliveryProduct: $isDeliveryProduct, widthTemplate: $widthTemplate, heightTemplate: $heightTemplate, empId: $empId, status: $status, paper: $paper, customer: $customer)';
  }

  CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  Future<void> newOrder() {
    // Call the user's CollectionReference to add a new user
    return orders
        .add({
          'name': name,
          'weightProduct': weightProduct,
          'widthBox': widthBox,
          'longBox': longBox,
          'heightBox': heightBox,
          'unit': unit,
          'orderAmount': orderAmount,
          'isHumidityProduct': isHumidityProduct,
          'isHumidityWarehouse': isHumidityWarehouse,
          'amount_stack_warehouse': amount_stack_warehouse,
          'useDesignService': useDesignService,
          'isSharpPrint': isSharpPrint,
          'isUseColorOver': isUseColorOver,
          'artwork': artwork,
          'isDeliveryProduct': isDeliveryProduct,
          'widthTemplate': widthTemplate,
          'heightTemplate': heightTemplate,
          'empId': empId,
          'status': status,
          'paper': paper,
          'customer': customer,
          'materialCalcualate' :materialCalculate

        })
        .then((value) => print("Order Added"))
        .catchError((error) => print("Failed to add Order: $error"));
  }


  //ราคาต่อต้นทุนกล่อง
  double pricePerBox = 0;
  //จำนวนกระดาษที่ต้องสั่ง(ผ่านการเช็คขั้นต่ำ)
  num paperAmount = 0;
  //จำนวนกล่องที่ต้องสั่ง (ผ่านการเช็คขั้นต่ำ)
  num boxAmount = 0;

  //ต้นทุนรวม
  num costNet=0;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'weightProduct': weightProduct,
      'widthBox': widthBox,
      'longBox': longBox,
      'heightBox': heightBox,
      'unit': unit,
      'orderAmount': orderAmount,
      'isHumidityProduct': isHumidityProduct,
      'isHumidityWarehouse': isHumidityWarehouse,
      'amount_stack_warehouse': amount_stack_warehouse,
      'useDesignService': useDesignService,
      'isSharpPrint': isSharpPrint,
      'isUseColorOver': isUseColorOver,
      'artwork': artwork,
      'isDeliveryProduct': isDeliveryProduct,
      'widthTemplate': widthTemplate,
      'heightTemplate': heightTemplate,
      'empId': empId,
      'status': status,
      'paper': paper,
      'customer': customer,
    };
  }

  factory BoxOrder.fromMap(Map<String, dynamic> map) {
    return BoxOrder(
      id: map['id'],
      name: map['name'] ?? '',
      weightProduct: map['weightProduct']?.toDouble() ?? 0.0,
      widthBox: map['widthBox']?.toDouble() ?? 0.0,
      longBox: map['longBox']?.toDouble() ?? 0.0,
      heightBox: map['heightBox']?.toDouble() ?? 0.0,
      unit: map['unit']?.toInt() ?? 0,
      orderAmount: map['orderAmount']?.toInt() ?? 0,
      isHumidityProduct: map['isHumidityProduct']?.toInt() ?? 0,
      isHumidityWarehouse: map['isHumidityWarehouse']?.toInt() ?? 0,
      amount_stack_warehouse: map['amount_stack_warehouse'] ?? false,
      useDesignService: map['useDesignService']?.toInt() ?? 0,
      isSharpPrint: map['isSharpPrint']?.toInt() ?? 0,
      isUseColorOver: map['isUseColorOver'] ?? false,
      artwork: map['artwork'] ?? '',
      isDeliveryProduct: map['isDeliveryProduct']?.toInt() ?? 0,
      widthTemplate: map['widthTemplate']?.toDouble() ?? 0.0,
      heightTemplate: map['heightTemplate']?.toDouble() ?? 0.0,
      empId: map['empId'] ?? '',
      status: map['status'] ?? '',
      paper: map['paper'] ?? '',
      customer: map['customer'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BoxOrder.fromJson(String source) =>
      BoxOrder.fromMap(json.decode(source));

  BoxOrder copyWith({
    String? id,
    String? name,
    double? weightProduct,
    double? widthBox,
    double? longBox,
    double? heightBox,
    int? unit,
    int? orderAmount,
    int? isHumidityProduct,
    int? isHumidityWarehouse,
    bool? amount_stack_warehouse,
    int? useDesignService,
    int? isSharpPrint,
    bool? isUseColorOver,
    String? artwork,
    int? isDeliveryProduct,
    double? widthTemplate,
    double? heightTemplate,
    String? empId,
    String? status,
    String? paper,
    String? customer,
  }) {
    return BoxOrder(
      id: id ?? this.id,
      name: name ?? this.name,
      weightProduct: weightProduct ?? this.weightProduct,
      widthBox: widthBox ?? this.widthBox,
      longBox: longBox ?? this.longBox,
      heightBox: heightBox ?? this.heightBox,
      unit: unit ?? this.unit,
      orderAmount: orderAmount ?? this.orderAmount,
      isHumidityProduct: isHumidityProduct ?? this.isHumidityProduct,
      isHumidityWarehouse: isHumidityWarehouse ?? this.isHumidityWarehouse,
      amount_stack_warehouse:
          amount_stack_warehouse ?? this.amount_stack_warehouse,
      useDesignService: useDesignService ?? this.useDesignService,
      isSharpPrint: isSharpPrint ?? this.isSharpPrint,
      isUseColorOver: isUseColorOver ?? this.isUseColorOver,
      artwork: artwork ?? this.artwork,
      isDeliveryProduct: isDeliveryProduct ?? this.isDeliveryProduct,
      widthTemplate: widthTemplate ?? this.widthTemplate,
      heightTemplate: heightTemplate ?? this.heightTemplate,
      empId: empId ?? this.empId,
      status: status ?? this.status,
      paper: paper ?? this.paper,
      customer: customer ?? this.customer,
    );
  }
}
