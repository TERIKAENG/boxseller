import 'dart:convert';
import 'dart:math';

import 'package:boxseller/get/getData.dart';
import 'package:boxseller/model/calculateMat.dart';
import 'package:boxseller/model/material.dart';
import 'package:boxseller/model/template.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/order.dart';

class Algorithm {
  static String findPapertype(BoxOrder box) {
    String ronType = '';
    if (box.isHumidityProduct == 2) {
      ronType = 'E';
    } else {
      if (box.weightProduct >= 10) {
        ronType = 'BC';
      } else {
        if (box.isHumidityProduct == 1) {
          ronType = 'C';
        } else {
          if (box.isHumidityWarehouse == 1) {
            ronType = 'C';
          } else {
            if (box.amount_stack_warehouse) {
              ronType = 'BC';
            } else {
              if (box.isDeliveryProduct == 1) {
                ronType = 'C';
              } else {
                if (box.isSharpPrint == 1) {
                  ronType = 'B';
                } else {
                  ronType = 'C';
                }
              }
            }
          }
        }
      }
    }
    return ronType;
  }

  static BoxOrder calculateTemplate(BoxOrder box) {
    var widthCal = 0.0;
    var heightCal = 0.0;

    if (box.ronType == 'BC') {
      widthCal = ((((box.widthBox - 3) / 2)) * 2) + box.heightBox;
      heightCal = (box.widthBox - 3) + (box.longBox * 2) + box.widthBox + 30;
    } else {
      widthCal = ((((box.widthBox - 2) / 2)) * 2) + box.heightBox;
      heightCal = (box.widthBox - 2) + (box.longBox * 2) + box.widthBox + 26;
    }

    box.widthTemplate = widthCal;
    box.heightTemplate = heightCal;
    return box;
  }

  static double getWidth_Variants(BoxOrder box) {
    var w = 0.0;
    if (box.ronType == 'BC') {
      w = box.widthBox - 3;
    } else {
      w = box.widthBox - 2;
    }
    return w;
  }

  static double getHeight_Variants(BoxOrder box) {
    double w = 0.0;
    if (box.ronType == 'BC') {
      w = ((box.widthBox - 3) / 2) + 2;
    } else {
      w = ((box.widthBox - 2) / 2) + 2;
    }
    return w;
  }

  static double getVariants(BoxOrder box) {
    if (box.ronType == 'BC') {
      return 30;
    }
    return 26;
  }

  static Future<BoxOrder> findVenderPaper(BoxOrder box) async {
    List<MaterialPaper> materials = [];

    await GetData()
        .getDataMaterialsBySpec(box.paper, box.ronType!)
        .then((value) {
      materials = value;
    }).catchError((error) {
      print('ERROR fetch material 2333 : $error');
    });

    for (int i = 0; i < materials.length; i++) {
      var result = compareBoxPerMaterial(box.widthTemplate, box.heightTemplate,
          materials[i].widthPaper, materials[i].heightPaper);
      materials[i].calculateMat.bestestTemplate = result;
      materials[i].calculateMat.paperAmount = getAmountOrder(
          materials[i].minimumPaper,
          box.orderAmount,
          materials[i].calculateMat);
      materials[i].calculateMat.boxAmount =
          calculateBoxAmount(materials[i].calculateMat);
      materials[i].calculateMat.pricePerBox =
          calculatePricePerBox(materials[i].calculateMat, materials[i], box);
      materials[i].calculateMat.costNet =
          calculateCostNet(materials[i].calculateMat, box);
      materials[i].calculateMat.deliverDate =
          estimateDeliverDate(materials[i], box);
    }

    box.materialCalculate = materials;
    return box;
  }

  static dynamic compareBoxPerMaterial(double boxTemplateWidth,
      boxTemplateHeight, venderPaperWidth, venderPaperHeight)  {
    List<Map<String, dynamic>> lst = [];
    var obj = Algorithm.findPatternModel1(boxTemplateWidth, boxTemplateHeight,
        venderPaperWidth, venderPaperHeight, 0);
    lst.add(obj);

    var obj2 = Algorithm.findPatternModel1(boxTemplateHeight, boxTemplateWidth,
        venderPaperWidth, venderPaperHeight, 0);
    lst.add(obj2);

    var obj3 = Algorithm.findPatternModel2(boxTemplateWidth, boxTemplateHeight,
        venderPaperWidth, venderPaperHeight, 0);
    lst.add(obj3);

    var obj4 = Algorithm.findPatternModel2(boxTemplateHeight, boxTemplateWidth,
        venderPaperWidth, venderPaperHeight, 0);
    lst.add(obj4);

    var obj5 = Algorithm.findPatternModel3(boxTemplateWidth, boxTemplateHeight,
        venderPaperWidth, venderPaperHeight, 0);
    lst.add(obj5);

    var obj6 = Algorithm.findPatternModel3(boxTemplateHeight, boxTemplateWidth,
        venderPaperWidth, venderPaperHeight, 0);
    lst.add(obj6);

    var obj7 = Algorithm.findPatternModel4(boxTemplateWidth, boxTemplateHeight,
        venderPaperWidth, venderPaperHeight, 0);
    lst.add(obj7);

    var obj8 = Algorithm.findPatternModel4(boxTemplateHeight, boxTemplateWidth,
        venderPaperWidth, venderPaperHeight, 0);
    lst.add(obj8);

    // await newLog(lst);

    dynamic max;
    if (lst.isNotEmpty) {
      max = lst.first;
      for (var e in lst) {
        if (e['countbox'] > max['countbox']) max = e;
      }
      print(max.toString());
    }

    return max;
  }

  // static CollectionReference calculateLogs =
  //     FirebaseFirestore.instance.collection('calculateLogs');

  // static Future<void> newLog(List<Map<String, dynamic>> lst) {
  //   var res = jsonEncode(lst);
  //   // Call the user's CollectionReference to add a new user

  //   return calculateLogs
  //       .add(res)
  //       .then((value) => print("Order Added"))
  //       .catchError((error) => print("Failed to add Order: $error"));
  // }

  static Map<String, dynamic> findPatternModel1(double smWidth, double smHeight,
      double lgWidth, double lgHeight, int countbox) {
    var primaryRow = 0;
    var primaryPerRow = 0;
    var rotateRow = 0;
    var rotatePerRow = 0;

    while (smHeight < lgHeight) {
      var amount = lgWidth ~/ smWidth;
      primaryPerRow = amount;
      countbox = countbox + amount;
      primaryRow += 1;
      lgHeight = lgHeight - smHeight;
    }

    while (smWidth < lgHeight) {
      var amount2 = lgWidth ~/ smHeight;
      rotatePerRow = amount2;
      countbox = countbox + amount2;
      rotateRow += 1;
      lgHeight = lgHeight - smWidth;
    }

    if (primaryRow > 12) {
      primaryRow = 12;
    }

    if (rotateRow > 12) {
      rotateRow = 12;
    }

    return {
      'start_width': smWidth,
      'start_height': smHeight,
      'countbox': countbox,
      'primaryRow': primaryRow,
      'primaryPerRow': primaryPerRow,
      'rotateRow': rotateRow,
      'rotatePerRow': rotatePerRow
    };
  }

  static Map<String, dynamic> findPatternModel2(double smWidth, double smHeight,
      double lgWidth, double lgHeight, int countbox) {
    var primaryRow = 0;
    var primaryPerRow = 0;
    var rotateRow = 0;
    var rotatePerRow = 0;

    while (smHeight < lgHeight) {
      var amount = lgWidth ~/ smWidth;
      primaryPerRow = amount;
      countbox = countbox + amount;
      primaryRow += 1;
      lgHeight = lgHeight - smHeight;
    }

    countbox = countbox - primaryPerRow;
    primaryRow -= 1;
    lgHeight = lgHeight + smHeight;

    while (smWidth < lgHeight) {
      var amount2 = lgWidth ~/ smHeight;
      rotatePerRow = amount2;
      countbox = countbox + amount2;
      rotateRow += 1;
      lgHeight = lgHeight - smWidth;
    }

    if (primaryRow > 12) {
      primaryRow = 12;
    }

    if (rotateRow > 12) {
      rotateRow = 12;
    }

    return {
      'start_width': smWidth,
      'start_height': smHeight,
      'countbox': countbox,
      'primaryRow': primaryRow,
      'primaryPerRow': primaryPerRow,
      'rotateRow': rotateRow,
      'rotatePerRow': rotatePerRow
    };
  }

  static Map<String, dynamic> findPatternModel3(double smWidth, double smHeight,
      double lgWidth, double lgHeight, int countbox) {
    var primaryRow = 0;
    var primaryPerRow = 0;
    var rotateRow = 0;
    var rotatePerRow = 0;

    while (smWidth < lgWidth) {
      var amount = lgHeight ~/ smHeight;
      primaryPerRow = amount;
      countbox = countbox + amount;
      primaryRow += 1;
      lgWidth = lgWidth - smWidth;
    }

    while (smHeight < lgWidth) {
      var amount2 = lgWidth ~/ smWidth;
      rotatePerRow = amount2;
      countbox = countbox + amount2;
      rotateRow += 1;
      lgWidth = lgWidth - smHeight;
    }

    if (primaryRow > 12) {
      primaryRow = 12;
    }

    if (rotateRow > 12) {
      rotateRow = 12;
    }

    return {
      'start_width': smWidth,
      'start_height': smHeight,
      'countbox': countbox,
      'primaryRow': primaryRow,
      'primaryPerRow': primaryPerRow,
      'rotateRow': rotateRow,
      'rotatePerRow': rotatePerRow
    };
  }

  static Map<String, dynamic> findPatternModel4(double smWidth, double smHeight,
      double lgWidth, double lgHeight, int countbox) {
    var primaryRow = 0;
    var primaryPerRow = 0;
    var rotateRow = 0;
    var rotatePerRow = 0;

    while (smWidth < lgWidth) {
      var amount = lgHeight ~/ smHeight;
      primaryPerRow = amount;
      countbox = countbox + amount;
      primaryRow += 1;
      lgWidth = lgWidth - smWidth;
    }

    countbox = countbox - primaryPerRow;
    primaryRow -= 1;
    lgWidth = lgWidth + smWidth;

    while (smHeight < lgWidth) {
      var amount2 = lgHeight ~/ smWidth;
      rotatePerRow = amount2;
      countbox = countbox + amount2;
      rotateRow += 1;
      lgWidth = lgWidth - smHeight;
    }

    if (primaryRow > 12) {
      primaryRow = 12;
    }

    if (rotateRow > 12) {
      rotateRow = 12;
    }

    return {
      'start_width': smWidth,
      'start_height': smHeight,
      'countbox': countbox,
      'primaryRow': primaryRow,
      'primaryPerRow': primaryPerRow,
      'rotateRow': rotateRow,
      'rotatePerRow': rotatePerRow
    };
  }

  static num getAmountOrder(
      int matMinimum, int orderAmount, CalculateMat calculateMat) {
    var allMat =
        (orderAmount / calculateMat.bestestTemplate['countbox']).ceil();
    if (allMat < matMinimum) {
      return matMinimum;
    }
    return allMat;
  }

  static double calculatePricePerBox(
      CalculateMat calculateMat, MaterialPaper materialPaper, BoxOrder box) {
    var cost = (calculateMat.paperAmount * materialPaper.pricePaper) /
        calculateBoxAmount(calculateMat);

    return cost;
  }

  static num calculateBoxAmount(CalculateMat calculateMat) {
    return calculateMat.bestestTemplate['countbox'] * calculateMat.paperAmount;
  }

  static num calculateCostNet(CalculateMat calculateMat, BoxOrder box) {
    var cost = 0.0;
    if (box.isUseColorOver) {
      cost = calculateMat.pricePerBox + 2;
    } else {
      cost = calculateMat.pricePerBox;
    }

    var costNet = cost * calculateMat.boxAmount;
    costNet = costNet + (costNet * 0.3); // + กำไร 30%

    if (box.useDesignService == 1 || box.useDesignService == 2) {
      if (box.codeColor == 'black' ||
          box.codeColor == 'red' ||
          box.codeColor == 'green' ||
          box.codeColor == 'blue') {
      } else {
        costNet = costNet + 1600; //-> ค่าผสมสี
      }
      costNet = costNet + 800; //-> ค่าบล็อคพิม
      costNet = costNet +
          ((box.printArea! * 6) *
              calculateMat.boxAmount); //-> ค่าพิมตารางนิ้วละ 6 บาท ต่อกล่อง
    }
    return costNet;
  }

  static DateTime estimateDeliverDate(
      MaterialPaper materialPaper, BoxOrder box) {
    DateTime result = DateTime.now();

    var develiverPeroid = materialPaper.deliverIndays + 8;

    while (develiverPeroid > 0) {
      print('develiverPeroid = $develiverPeroid');
      print('develiverPeroid = $develiverPeroid');
      print('result.weekday = ${result.weekday}');
      result = result.add(const Duration(days: 1));
      if (result.weekday != DateTime.saturday &&
          result.weekday != DateTime.sunday) {
        develiverPeroid = develiverPeroid - 1;
        print('develiverPeroid = $develiverPeroid');
      }
    }

    return result;
  }
}
