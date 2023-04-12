// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'calculateMat.dart';

class MaterialPaper {
  String? id;

  String vender;
  String venderName;

  String paperType;
  String layer1;
  String layer2;
  String layer3;
  String layer4;
  String layer5;
  String ronType;
  double widthPaper;
  double heightPaper;
  double pricePaper;
  int minimumPaper;
  int deliverIndays
  ;
  CalculateMat calculateMat = CalculateMat(
      boxAmount: 0,
      costNet: 0,
      paperAmount: 0,
      pricePerBox: 0,
      bestestTemplate: {});

  MaterialPaper(
      {this.id,
      required this.vender,
      required this.venderName,
      required this.paperType,
      required this.layer1,
      required this.layer2,
      required this.layer3,
      required this.layer4,
      required this.layer5,
      required this.ronType,
      required this.widthPaper,
      required this.heightPaper,
      required this.pricePaper,
      required this.minimumPaper,
      required this.deliverIndays,
      required this.calculateMat});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'vender': vender,
      'venderName': venderName,
      'paperType': paperType,
      'layer1': layer1,
      'layer2': layer2,
      'layer3': layer3,
      'layer4': layer4,
      'layer5': layer5,
      'ronType': ronType,
      'widthPaper': widthPaper,
      'heightPaper': heightPaper,
      'pricePaper': pricePaper,
      'minimumPaper': minimumPaper,
      'deliverIndays': deliverIndays,
      'calculateMat': calculateMat
    };
  }

  factory MaterialPaper.fromMap(Map<String, dynamic> map,int mode) {
    
    return MaterialPaper(
      id: map['id'] != null ? map['id'] as String : null,
      vender: map['vender'] as String,
      venderName: map['venderName'] as String,
      paperType: map['paperType'] as String,
      layer1: map['layer1'] as String,
      layer2: map['layer2'] as String,
      layer3: map['layer3'] as String,
      layer4: map['layer4'] as String,
      layer5: map['layer5'] as String,
      ronType: map['ronType'] as String,
      widthPaper: map['widthPaper'] as double,
      heightPaper: map['heightPaper'] as double,
      pricePaper: map['pricePaper'] as double,
      minimumPaper: map['minimumPaper'] as int,
      deliverIndays: map['deliverIndays'] as int,
      calculateMat: mode == 1 ? CalculateMat.fromJson(map['calculateMat']) : CalculateMat.fromJson(json.decode(map['calculateMat'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory MaterialPaper.fromJson(String source,int mode) =>
      MaterialPaper.fromMap(json.decode(source) as Map<String, dynamic>,mode);

  MaterialPaper copyWith(
      {String? id,
      String? vender,
      String? venderName,
      String? paperType,
      String? layer1,
      String? layer2,
      String? layer3,
      String? layer4,
      String? layer5,
      String? ronType,
      double? widthPaper,
      double? heightPaper,
      double? pricePaper,
      int? minimumPaper,
      int? deliverIndays,
      CalculateMat? calculateMat}) {
    return MaterialPaper(
      id: id ?? this.id,
      vender: vender ?? this.vender,
      venderName: venderName ?? this.venderName,
      paperType: paperType ?? this.paperType,
      layer1: layer1 ?? this.layer1,
      layer2: layer2 ?? this.layer2,
      layer3: layer3 ?? this.layer3,
      layer4: layer4 ?? this.layer4,
      layer5: layer5 ?? this.layer5,
      ronType: ronType ?? this.ronType,
      widthPaper: widthPaper ?? this.widthPaper,
      heightPaper: heightPaper ?? this.heightPaper,
      pricePaper: pricePaper ?? this.pricePaper,
      minimumPaper: minimumPaper ?? this.minimumPaper,
      deliverIndays: deliverIndays ?? this.deliverIndays,
      calculateMat: calculateMat ?? this.calculateMat,
    );
  }

  @override
  String toString() {
    return 'MaterialPaper(id: $id, vender: $vender, venderName: $venderName, paperType: $paperType, layer1: $layer1, layer2: $layer2, layer3: $layer3, layer4: $layer4, layer5: $layer5, ronType: $ronType, widthPaper: $widthPaper, heightPaper: $heightPaper, pricePaper: $pricePaper, minimumPaper: $minimumPaper, deliverIndays: $deliverIndays)';
  }

  CollectionReference materials =
      FirebaseFirestore.instance.collection('materials');

  Future<void> newMaterial() {
    // Call the user's CollectionReference to add a new user
    return materials
        .add({
          'vender': vender,
          'venderName': venderName,
          'paperType': paperType,
          'layer1': layer1,
          'layer2': layer2,
          'layer3': layer3,
          'layer4': layer4,
          'layer5': layer5,
          'ronType': ronType,
          'widthPaper': widthPaper,
          'heightPaper': heightPaper,
          'pricePaper': pricePaper,
          'minimumPaper': minimumPaper,
          'deliverIndays': deliverIndays,
          'calculateMat': json.encode(calculateMat),
        })
        .then((value) => print("Order Added"))
        .catchError((error) => print("Failed to add Order: $error"));
  }

  @override
  bool operator ==(covariant MaterialPaper other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.vender == vender &&
        other.venderName == venderName &&
        other.paperType == paperType &&
        other.layer1 == layer1 &&
        other.layer2 == layer2 &&
        other.layer3 == layer3 &&
        other.layer4 == layer4 &&
        other.layer5 == layer5 &&
        other.ronType == ronType &&
        other.widthPaper == widthPaper &&
        other.heightPaper == heightPaper &&
        other.pricePaper == pricePaper &&
        other.minimumPaper == minimumPaper &&
        other.deliverIndays == deliverIndays;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        vender.hashCode ^
        venderName.hashCode ^
        paperType.hashCode ^
        layer1.hashCode ^
        layer2.hashCode ^
        layer3.hashCode ^
        layer4.hashCode ^
        layer5.hashCode ^
        ronType.hashCode ^
        widthPaper.hashCode ^
        heightPaper.hashCode ^
        pricePaper.hashCode ^
        minimumPaper.hashCode ^
        deliverIndays.hashCode;
  }
}
