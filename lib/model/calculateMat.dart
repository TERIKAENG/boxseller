// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CalculateMat {
  //การวางที่ดีที่สุด
  Map<String, dynamic> bestestTemplate = {};

  //ราคาต่อต้นทุนกล่อง
  double pricePerBox = 0;
  //จำนวนกระดาษที่ต้องสั่ง(ผ่านการเช็คขั้นต่ำ)
  num paperAmount = 0;
  //จำนวนกล่องที่ต้องสั่ง (ผ่านการเช็คขั้นต่ำ)
  num boxAmount = 0;

  //ต้นทุนรวม
  num costNet = 0;

  DateTime? deliverDate = DateTime.now();





  CalculateMat({
    required this.bestestTemplate,
    required this.pricePerBox,
    required this.paperAmount,
    required this.boxAmount,
    required this.costNet,
    this.deliverDate
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bestestTemplate': bestestTemplate,
      'pricePerBox': pricePerBox,
      'paperAmount': paperAmount,
      'boxAmount': boxAmount,
      'costNet': costNet,
      'deliverDate':deliverDate.toString(),
    };
  }

  factory CalculateMat.fromMap(Map<String, dynamic> map) {
    return CalculateMat(
      bestestTemplate: map['bestestTemplate'],
      pricePerBox: map['pricePerBox'] as double,
      paperAmount: map['paperAmount'] as num,
      boxAmount: map['boxAmount'] as num,
      costNet: map['costNet'] as num,
      deliverDate: map['deliverDate'] != null ?  DateTime.parse(map['deliverDate'] ) : DateTime.now()
    );
  }

  String toJson() => json.encode(toMap());

  factory CalculateMat.fromJson(String source) =>
      CalculateMat.fromMap(json.decode(source) as Map<String, dynamic>);
}
