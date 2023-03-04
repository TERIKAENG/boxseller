import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class BoxOrder {
  String id;
  String name;
  double weightProduct;
  double widthBox;
  double longBox;
  double heightBox;
  int unit;
  int orderAmount;
  int isHumidityProduct;
  int isHumidityWarehouse;
  int amount_stack_warehouse;
  int useDesignService;
  int isSharpPrint;
  bool isUseColorOver;
  String artwork;
  int isDeliveryProduct;
  double widthTemplate;
  double heightTeplate;
  String empId;
  String status;
  BoxOrder({
    required this.id,
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
    required this.heightTeplate,
    required this.empId,
    required this.status,
  });

  @override
  String toString() {
    return 'BoxOrder(id: $id, name: $name, weightProduct: $weightProduct, widthBox: $widthBox, longBox: $longBox, heightBox: $heightBox, unit: $unit, orderAmount: $orderAmount, isHumidityProduct: $isHumidityProduct, isHumidityWarehouse: $isHumidityWarehouse, amount_stack_warehouse: $amount_stack_warehouse, useDesignService: $useDesignService, isSharpPrint: $isSharpPrint, isUseColorOver: $isUseColorOver, artwork: $artwork, isDeliveryProduct: $isDeliveryProduct, widthTemplate: $widthTemplate, heightTeplate: $heightTeplate, empId: $empId, status: $status)';
  }

  CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  Future<void> newOrder() {
    // Call the user's CollectionReference to add a new user
    return orders
        .add({
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
          'heightTeplate': heightTeplate,
          'empId': empId,
          'status': status,
        })
        .then((value) => print("Order Added"))
        .catchError((error) => print("Failed to add Order: $error"));
  }

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
      'heightTeplate': heightTeplate,
      'empId': empId,
      'status': status,
    };
  }

  factory BoxOrder.fromMap(Map<String, dynamic> map) {
    return BoxOrder(
      id: map['id'] as String,
      name: map['name'] as String,
      weightProduct: map['weightProduct'] as double,
      widthBox: map['widthBox'] as double,
      longBox: map['longBox'] as double,
      heightBox: map['heightBox'] as double,
      unit: map['unit'] as int,
      orderAmount: map['orderAmount'] as int,
      isHumidityProduct: map['isHumidityProduct'] as int,
      isHumidityWarehouse: map['isHumidityWarehouse'] as int,
      amount_stack_warehouse: map['amount_stack_warehouse'] as int,
      useDesignService: map['useDesignService'] as int,
      isSharpPrint: map['isSharpPrint'] as int,
      isUseColorOver: map['isUseColorOver'] as bool,
      artwork: map['artwork'] as String,
      isDeliveryProduct: map['isDeliveryProduct'] as int,
      widthTemplate: map['widthTemplate'] as double,
      heightTeplate: map['heightTeplate'] as double,
      empId: map['empId'] as String,
      status: map['status'] as String,
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
    int? amount_stack_warehouse,
    int? useDesignService,
    int? isSharpPrint,
    bool? isUseColorOver,
    String? artwork,
    int? isDeliveryProduct,
    double? widthTemplate,
    double? heightTeplate,
    String? empId,
    String? status,
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
      heightTeplate: heightTeplate ?? this.heightTeplate,
      empId: empId ?? this.empId,
      status: status ?? this.status,
    );
  }
}
