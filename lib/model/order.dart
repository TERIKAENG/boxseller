// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:boxseller/model/calculateMat.dart';
import 'package:boxseller/model/material.dart';

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
  // DateTime timestamp;

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
    this.ronType,
    this.material,
    this.materialCalculate,
  });

  @override
  String toString() {
    return 'BoxOrder(id: $id, name: $name, weightProduct: $weightProduct, widthBox: $widthBox, longBox: $longBox, heightBox: $heightBox, unit: $unit, orderAmount: $orderAmount, isHumidityProduct: $isHumidityProduct, isHumidityWarehouse: $isHumidityWarehouse, amount_stack_warehouse: $amount_stack_warehouse, useDesignService: $useDesignService, isSharpPrint: $isSharpPrint, isUseColorOver: $isUseColorOver, artwork: $artwork, isDeliveryProduct: $isDeliveryProduct, widthTemplate: $widthTemplate, heightTemplate: $heightTemplate, empId: $empId, status: $status, paper: $paper, customer: $customer, ronType: $ronType, material: $material, materialCalculate: $materialCalculate)';
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
          'materialCalculate': json.encode(materialCalculate),
          'rontype': ronType,
          // 'timestamp': timestamp,
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
  num costNet = 0;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
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
      'ronType': ronType,
      // 'material': material?.toMap(),
      'materialCalculate': materialCalculate,
    };
  }

  factory BoxOrder.fromMap(Map<String, dynamic> map) {

    var mp = map['materialCalculate'];
    var mpp = json.decode(mp);


    List<MaterialPaper> data = [];

    for (var i = 0; i < mpp.length; i++) {
      var newM = MaterialPaper.fromJson(mpp[i],1);
      data.add(newM);
    }

    return BoxOrder(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      weightProduct: map['weightProduct'] as double,
      widthBox: map['widthBox'] as double,
      longBox: map['longBox'] as double,
      heightBox: map['heightBox'] as double,
      unit: map['unit'] as int,
      orderAmount: map['orderAmount'] as int,
      isHumidityProduct: map['isHumidityProduct'] as int,
      isHumidityWarehouse: map['isHumidityWarehouse'] as int,
      amount_stack_warehouse: map['amount_stack_warehouse'] as bool,
      useDesignService: map['useDesignService'] as int,
      isSharpPrint: map['isSharpPrint'] as int,
      isUseColorOver: map['isUseColorOver'] as bool,
      artwork: map['artwork'] as String,
      isDeliveryProduct: map['isDeliveryProduct'] as int,
      widthTemplate: map['widthTemplate'] as double,
      heightTemplate: map['heightTemplate'] as double,
      empId: map['empId'] as String,
      status: map['status'] as String,
      paper: map['paper'] as String,
      customer: map['customer'] as String,
      ronType: map['ronType'] != null ? map['ronType'] as String : null,
      // material: map['material'] != null ? Object.fromMap(map['material'] as Map<String,dynamic>) : null,
      materialCalculate: data,
    );
  }

  String toJson() => json.encode(toMap());

  factory BoxOrder.fromJson(String source) =>
      BoxOrder.fromMap(json.decode(source) as Map<String, dynamic>);

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
    String? ronType,
    Object? material,
    List<MaterialPaper>? materialCalculate,
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
      ronType: ronType ?? this.ronType,
      material: material ?? this.material,
      materialCalculate: materialCalculate ?? this.materialCalculate,
    );
  }
}
