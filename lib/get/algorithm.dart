import 'dart:convert';
import 'dart:math';

import 'package:boxseller/get/getData.dart';
import 'package:boxseller/model/calculateMat.dart';
import 'package:boxseller/model/material.dart';
import 'package:boxseller/model/template.dart';

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
      widthCal = ((((box.widthBox - 3) / 2) + 2) * 2) + box.heightBox;
      heightCal = (box.widthBox - 3) + (box.longBox * 2) + box.widthBox + 30;
    } else {
      widthCal = ((((box.widthBox - 2) / 2) + 2) * 2) + box.heightBox;
      heightCal = (box.widthBox - 2) + (box.longBox * 2) + box.widthBox + 26;
    }

    box.widthTemplate = widthCal;
    box.heightTemplate = heightCal;
    return box;
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
    }

    box.materialCalculate = materials;
    return box;
  }

  static dynamic compareBoxPerMaterial(double boxTemplateWidth,
      boxTemplateHeight, venderPaperWidth, venderPaperHeight) {
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

    if (box.isUseColorOver) {
      cost = cost + 2; // เทสีเยอะบวกกล่องละ 2 บาท
    }

    return cost;
  }

  static num calculateBoxAmount(CalculateMat calculateMat) {
    return calculateMat.bestestTemplate['countbox'] * calculateMat.paperAmount;
  }

  static num calculateCostNet(CalculateMat calculateMat) {
    return (calculateMat.pricePerBox * calculateMat.boxAmount) +
        (calculateMat.pricePerBox * 0.3); // + กำไร 30%
  }
}
