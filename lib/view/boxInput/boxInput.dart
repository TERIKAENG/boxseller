import 'package:boxseller/get/algorithm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:boxseller/Utils/Palette.dart';
import 'package:boxseller/model/order.dart';
import 'package:boxseller/widget/edittext.dart';
import 'package:boxseller/widget/logo.dart';
import 'package:boxseller/widget/text_widget.dart';

import '../../model/customer.dart';
import '../../widget/button_app.dart';

class BoxInputPage extends StatefulWidget {
  Customer customer;

  BoxInputPage({
    Key? key,
    required this.customer,
  }) : super(key: key);

  @override
  State<BoxInputPage> createState() => _BoxInputPageState();
}

class _BoxInputPageState extends State<BoxInputPage> {
  String productName = '';
  double productWeight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        menu(),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
            ),
            Container(
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    header(),
                    productForm(),
                    lineSep(),
                    boxForm(),
                    lineSep(),
                    decoForm(),
                    ButtonApp.buttonMain(context, 'คำนวณราคาเเละวัตถุดิบกระดาษ',
                        () async {
                      bool valid = true;
                      if (productnameController.text == '') {
                        setState(() {
                          productnameValidator = false;
                          valid = false;
                        });
                      }

                      if (productWieghtController.text == '' &&
                          productWieghtController.text == '0') {
                        setState(() {
                          productWeightValidator = false;
                          valid = false;
                        });
                      }

                      if (amountOrderController.text == '' &&
                          amountOrderController.text == '0') {
                        setState(() {
                          amountOrderValidator = false;
                          valid = false;
                        });
                      }

                      if (widthBoxController.text == '' &&
                          widthBoxController.text == '0') {
                        setState(() {
                          widthBoxValidator = false;
                          valid = false;
                        });
                      }

                      if (longBoxController.text == '' &&
                          longBoxController.text == '0') {
                        setState(() {
                          longBoxValidator = false;
                          valid = false;
                        });
                      }

                      if (heightBoxController.text == '' &&
                          heightBoxController.text == '0') {
                        setState(() {
                          heightBoxValidator = false;
                          valid = false;
                        });
                      }
                      if (valid) {
                        BoxOrder newOrder = BoxOrder(
                            name: productName,
                            weightProduct: productWeight,
                            widthBox: widthBox,
                            longBox: longBox,
                            heightBox: heightBox,
                            unit: 1,
                            orderAmount: amountOrder,
                            isHumidityProduct: moistureProduct,
                            isHumidityWarehouse: moistureWarehouse,
                            amount_stack_warehouse: isStack,
                            useDesignService: deco,
                            isSharpPrint: concernIn,
                            isUseColorOver: isOverColor,
                            artwork: 'artwork',
                            isDeliveryProduct: deliver,
                            widthTemplate: 0,
                            heightTemplate: 0,
                            empId: 'admin',
                            status: 'true',
                            paper: paper,
                            customer: widget.customer.id!);

                        var findRon = Algorithm.findPapertype(newOrder);
                        newOrder.ronType = findRon;

                        newOrder = Algorithm.calculateTemplate(newOrder);
                        Algorithm.findVenderPaper(newOrder).then((value) {
                          newOrder = value;
                        });

                        newOrder.newOrder();
                        Navigator.pop(context, true);
                      }
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    )));
  }

  Widget menu() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height,
      color: greyBorder,
      child: Column(
        children: [
          UIkit.logo(),
          ButtonApp.buttonMain(context, 'ย้อนกลับ', () {
            Get.back();
          }),
        ],
      ),
    );
  }

  Widget header() {
    return TextWidget.textGeneral('รายการสั่งผลิตใหม่');
  }

  bool productnameValidator = true;
  bool productWeightValidator = true;

  var productnameController = TextEditingController();

  var productWieghtController = TextEditingController();
  Widget productForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            TextWidget.textGeneral('ข้อมูลผลิตภัณฑ์'),
          ],
        ),
        Edittext.edittextGeneral('ชื่อผลิตภัณฑ์', '', (value) {
          productName = value;
        }, productnameValidator, productnameController),
        Edittext.edittextNumber('น้ำหนักของผลิตภัณฑ์', '', (value) {
          try {
            productWeight = double.parse(value);
          } catch (e) {
            productWieghtController.text = '0';
          }
        }, productWeightValidator, productWieghtController),
        // Edittext.edittextGeneral('หน่วย', ''),
        deliveryCheck(),
        moistureProductCheck(),
        moistureWarehouseCheck(),
        isStackCheck(),
        concernInCheck()
      ],
    );
  }

  var amountOrder = 0;
  var amountOrderValidator = true;
  var amountOrderController = TextEditingController();

  var widthBox = 0.0;
  var widthBoxValidator = true;
  var widthBoxController = TextEditingController();

  var longBox = 0.0;
  var longBoxValidator = true;
  var longBoxController = TextEditingController();

  var heightBox = 0.0;
  var heightBoxValidator = true;
  var heightBoxController = TextEditingController();

  Widget boxForm() {
    return Column(
      children: [
        TextWidget.textGeneral('ข้อมูลบรรจุภัณฑ์ที่ต้องการสั่งผลิต'),
        Edittext.edittextGeneral('จำนวนที่ต้องการสั่งผลิต (ชิ้น)', '', (value) {
          try {
            amountOrder = int.parse(value);
          } catch (e) {
            amountOrderController.text = '0';
          }
        }, amountOrderValidator, amountOrderController),
        paperType(),
        Edittext.edittextGeneral('กว้าง', ',มิลลิเมตร', (value) {
          try {
            widthBox = double.parse(value);
          } catch (e) {
            widthBoxController.text = '0';
          }
        }, widthBoxValidator, widthBoxController),
        Edittext.edittextGeneral('ยาว', 'มิลลิเมตร', (value) {
          try {
            longBox = double.parse(value);
          } catch (e) {
            longBoxController.text = '0';
          }
        }, longBoxValidator, longBoxController),
        Edittext.edittextGeneral('สูง', 'มิลลิเมตร', (value) {
          try {
            heightBox = double.parse(value);
          } catch (e) {
            heightBoxController.text = '0';
          }
        }, heightBoxValidator, heightBoxController),
        // Edittext.edittextGeneral('หน่วย', ''),
      ],
    );
  }

  Widget decoForm() {
    return Column(children: [
      Row(
        children: [
          TextWidget.textGeneral('ลวดลายของบรรจุภัณฑ์'),
        ],
      ),
      isOverColorCheck(),
      decoyCheck()
    ]);
  }

  Widget lineSep() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
      child: Container(
        height: 1,
        color: brownlight,
      ),
    );
  }

  int deliver = -1;
  Widget deliveryCheck() {
    return Column(
      children: [
        Row(
          children: [
            TextWidget.textSubTitle('บรรจุภัณฑ์ต้องผ่านกระบวนการจัดส่ง'),
          ],
        ),
        Column(
          children: [
            RadioListTile(
              activeColor: brownDark,
              title: const Text("ใช่"),
              value: 1,
              groupValue: deliver,
              onChanged: (value) {
                setState(() {
                  deliver = value!;
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: const Text("ไม่ใช่"),
              value: 0,
              groupValue: deliver,
              onChanged: (value) {
                setState(() {
                  deliver = value!;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  int moistureProduct = -1;
  Widget moistureProductCheck() {
    return Column(
      children: [
        Row(
          children: [
            TextWidget.textSubTitle('ความชื้นของผลิตภัณฑ์'),
          ],
        ),
        Column(
          children: [
            RadioListTile(
              activeColor: brownDark,
              title: Text("ชื้น"),
              value: 2,
              groupValue: moistureProduct,
              onChanged: (value) {
                setState(() {
                  moistureProduct = value!;
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("ชื้นเล็กน้อย"),
              value: 1,
              groupValue: moistureProduct,
              onChanged: (value) {
                setState(() {
                  moistureProduct = value!;
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("ไม่ชื้น"),
              value: 0,
              groupValue: moistureProduct,
              onChanged: (value) {
                setState(() {
                  moistureProduct = value!;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  int moistureWarehouse = -1;
  Widget moistureWarehouseCheck() {
    return Column(
      children: [
        Row(
          children: [
            TextWidget.textSubTitle('คลังที่จัดเก็บมีความชื้นหรือไม่'),
          ],
        ),
        Column(
          children: [
            RadioListTile(
              activeColor: brownDark,
              title: Text("ชื้น"),
              value: 1,
              groupValue: moistureWarehouse,
              onChanged: (value) {
                setState(() {
                  moistureWarehouse = value!;
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("ไม่ชื้น"),
              value: 0,
              groupValue: moistureWarehouse,
              onChanged: (value) {
                setState(() {
                  moistureWarehouse = value!;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  bool isStack = false;
  Widget isStackCheck() {
    return Column(
      children: [
        Row(
          children: [
            TextWidget.textSubTitle('คลังที่จัดเก็บ'),
          ],
        ),
        CheckboxListTile(
          activeColor: brownDark,
          title: const Text("ซ้อนกันในคลังที่จัดเก็บมากกว่า 5 ชิ้น"),
          value: isStack,
          onChanged: (newValue) {
            setState(() {
              isStack = !isStack;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        ),
      ],
    );
  }

  int concernIn = -1;
  Widget concernInCheck() {
    return Column(
      children: [
        Row(
          children: [
            TextWidget.textSubTitle(
                'ความต้องการเพิ่มเติม : คุณสมบัติด้านบรรจุภัณฑ์'),
          ],
        ),
        Column(
          children: [
            RadioListTile(
              activeColor: brownDark,
              title: Text("เน้นลวดลาย"),
              value: 1,
              groupValue: concernIn,
              onChanged: (value) {
                setState(() {
                  concernIn = value!;
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("เน้นความเเข็งเเรง"),
              value: 0,
              groupValue: concernIn,
              onChanged: (value) {
                setState(() {
                  concernIn = value!;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  String paper = '';
  Widget paperType() {
    return Column(
      children: [
        Row(
          children: [
            TextWidget.textSubTitle('สีกระดาษ'),
          ],
        ),
        Column(
          children: [
            RadioListTile(
              activeColor: brownDark,
              title: Text("KS"),
              value: "KS",
              groupValue: paper,
              onChanged: (value) {
                setState(() {
                  paper = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("KK"),
              value: "KK",
              groupValue: paper,
              onChanged: (value) {
                setState(() {
                  paper = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("KA"),
              value: "KA",
              groupValue: paper,
              onChanged: (value) {
                setState(() {
                  paper = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("KL"),
              value: "KL",
              groupValue: paper,
              onChanged: (value) {
                setState(() {
                  paper = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("KI"),
              value: "KI",
              groupValue: paper,
              onChanged: (value) {
                setState(() {
                  paper = value.toString();
                });
              },
            ),
          ],
        )
      ],
    );
  }

  bool isOverColor = false;
  Widget isOverColorCheck() {
    return Column(
      children: [
        Row(
          children: [
            TextWidget.textSubTitle('คลังที่จัดเก็บ'),
          ],
        ),
        CheckboxListTile(
          activeColor: brownDark,
          title: Text("พิมพ์สีทั่วทั้งพื้นผิวกล่อง"),
          value: isOverColor,
          onChanged: (newValue) {
            setState(() {
              isOverColor = !isOverColor;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        ),
      ],
    );
  }

  int deco = -1;
  Widget decoyCheck() {
    return Column(
      children: [
        Row(
          children: [
            TextWidget.textSubTitle('ระบุลวดลาย'),
          ],
        ),
        Column(
          children: [
            RadioListTile(
              activeColor: brownDark,
              title: Text("ใช้บริการของทางร้าน"),
              value: 2,
              groupValue: deco,
              onChanged: (value) {
                setState(() {
                  deco = value!;
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("มีลวดลายเเล้ว"),
              value: 1,
              groupValue: deco,
              onChanged: (value) {
                setState(() {
                  deco = value!;
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("ไม่พิมพ์ลวดลาย"),
              value: 0,
              groupValue: deco,
              onChanged: (value) {
                setState(() {
                  deco = value!;
                });
              },
            ),
          ],
        )
      ],
    );
  }
}
