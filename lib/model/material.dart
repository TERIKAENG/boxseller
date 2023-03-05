import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'calculateMat.dart';

class MaterialPaper {
  String? id;

  String vender;

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
  int deliverIndays;

  CalculateMat? calculateMat = CalculateMat();

  MaterialPaper({
    this.id,
    required this.vender,
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
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'vender': vender,
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
    };
  }

  factory MaterialPaper.fromMap(Map<String, dynamic> map) {
    return MaterialPaper(
      id: map['id'],
      vender: map['vender'] ?? '',
      paperType: map['paperType'] ?? '',
      layer1: map['layer1'] ?? '',
      layer2: map['layer2'] ?? '',
      layer3: map['layer3'] ?? '',
      layer4: map['layer4'] ?? '',
      layer5: map['layer5'] ?? '',
      ronType: map['ronType'] ?? '',
      widthPaper: map['widthPaper']?.toDouble() ?? 0.0,
      heightPaper: map['heightPaper']?.toDouble() ?? 0.0,
      pricePaper: map['pricePaper']?.toDouble() ?? 0.0,
      minimumPaper: map['minimumPaper']?.toInt() ?? 0,
      deliverIndays: map['deliverIndays']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MaterialPaper.fromJson(String source) =>
      MaterialPaper.fromMap(json.decode(source));

  MaterialPaper copyWith({
    String? id,
    String? vender,
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
  }) {
    return MaterialPaper(
      id: id ?? this.id,
      vender: vender ?? this.vender,
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
    );
  }

  @override
  String toString() {
    return 'MaterialPaper(id: $id, vender: $vender, paperType: $paperType, layer1: $layer1, layer2: $layer2, layer3: $layer3, layer4: $layer4, layer5: $layer5, ronType: $ronType, widthPaper: $widthPaper, heightPaper: $heightPaper, pricePaper: $pricePaper, minimumPaper: $minimumPaper, deliverIndays: $deliverIndays)';
  }

  CollectionReference materials =
      FirebaseFirestore.instance.collection('materials');

  Future<void> newMaterial() {
    // Call the user's CollectionReference to add a new user
    return materials
        .add({
          'vender': vender,
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
        })
        .then((value) => print("Order Added"))
        .catchError((error) => print("Failed to add Order: $error"));
  }
}
