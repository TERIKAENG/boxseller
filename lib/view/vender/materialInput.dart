import 'package:boxseller/Utils/Palette.dart';
import 'package:boxseller/model/calculateMat.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../model/material.dart';
import '../../model/vender.dart';
import '../../widget/button_app.dart';
import '../../widget/edittext.dart';
import '../../widget/logo.dart';
import '../../widget/text_widget.dart';

class MeaterialInput extends StatefulWidget {
  Vender vender;

  MeaterialInput({
    Key? key,
    required this.vender,
  }) : super(key: key);

  @override
  State<MeaterialInput> createState() => _MeaterialInputState();
}

class _MeaterialInputState extends State<MeaterialInput> {
  late String _selectedUnit = 'cm';

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
                    //   lineSep(),
                    //   boxForm(),
                    //   lineSep(),
                    //   decoForm(),
                    ButtonApp.buttonMain(context, 'เพิ่มวัตถุดิบกระดาษ',
                        () async {
                      bool valid = true;
                      if (widthController.text == '' &&
                          widthController.text == '0') {
                        setState(() {
                          widthValidator = false;
                          valid = false;
                        });
                      }

                      if (heightController.text == '' &&
                          heightController.text == '0') {
                        setState(() {
                          heightValidator = false;
                          valid = false;
                        });
                      }

                      if (priceController.text == '' &&
                          priceController.text == '0') {
                        setState(() {
                          priceValidator = false;
                          valid = false;
                        });
                      }

                      if (minimumController.text == '' &&
                          minimumController.text == '0') {
                        setState(() {
                          minimumValidator = false;
                          valid = false;
                        });
                      }

                      if (deliverIndaysController.text == '' &&
                          deliverIndaysController.text == '0') {
                        setState(() {
                          deliverIndaysValidator = false;
                          valid = false;
                        });
                      }

                      if (_selectedUnit == 'cm') {
                        width = width * 10;
                        height = height * 10;
                      } else if (_selectedUnit == 'm') {
                        width = width * 1000;
                        height = height * 1000;
                      } else if (_selectedUnit == 'inch') {
                        width = width * 25.4;
                        height = height * 25.4;
                      }

                      if (valid) {
                        MaterialPaper newMaterial = MaterialPaper(
                            deliverIndays: deliverIndays,
                            heightPaper: height,
                            layer1: layer1,
                            layer2: layer2,
                            layer3: layer3,
                            layer4: layer4,
                            layer5: layer5,
                            minimumPaper: minimum,
                            paperType: paper,
                            pricePaper: price,
                            ronType: ron,
                            vender: widget.vender.id!,
                            venderName: widget.vender.name,
                            widthPaper: width,
                            calculateMat: CalculateMat(
                                pricePerBox: 0,
                                paperAmount: 0,
                                boxAmount: 0,
                                costNet: 0, bestestTemplate: {}));

                        await newMaterial.newMaterial();
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
    return TextWidget.textGeneral('รายการวัตถุดิบกระดาษใหม่');
  }

  String layer1 = '';
  bool layer1Validator = true;
  TextEditingController layer1Controller = TextEditingController();

  String layer2 = '';
  bool layer2Validator = true;
  TextEditingController layer2Controller = TextEditingController();

  String layer3 = '';
  bool layer3Validator = true;
  TextEditingController layer3Controller = TextEditingController();

  String layer4 = '';
  bool layer4Validator = true;
  TextEditingController layer4Controller = TextEditingController();

  String layer5 = '';
  bool layer5Validator = true;
  TextEditingController layer5Controller = TextEditingController();

  double width = 0;
  bool widthValidator = true;
  TextEditingController widthController = TextEditingController();

  double height = 0;
  bool heightValidator = true;
  TextEditingController heightController = TextEditingController();

  double price = 0;
  bool priceValidator = true;
  TextEditingController priceController = TextEditingController();

  int minimum = 0;
  bool minimumValidator = true;
  TextEditingController minimumController = TextEditingController();

  int deliverIndays = 0;
  bool deliverIndaysValidator = true;
  TextEditingController deliverIndaysController = TextEditingController();

  String ron = '';

  Widget productForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            TextWidget.textGeneral('ข้อมูลวัตถุดิบกระดาษ'),
          ],
        ),
        paperType(),
        ronType(),
        Edittext.edittextGeneral('กระดาษชั้นที่ 1', '', (value) {
          layer1 = value;
        }, layer1Validator, layer1Controller),
        Edittext.edittextGeneral('กระดาษชั้นที่ 2', '', (value) {
          layer2 = value;
        }, layer2Validator, layer2Controller),
        Edittext.edittextGeneral('กระดาษชั้นที่ 3', '', (value) {
          layer3 = value;
        }, layer3Validator, layer3Controller),
        ron == 'BC'
            ? Edittext.edittextGeneral('กระดาษชั้นที่ 4', '', (value) {
                layer4 = value;
              }, layer4Validator, layer4Controller)
            : Container(),
        ron == 'BC'
            ? Edittext.edittextGeneral('กระดาษชั้นที่ 5', '', (value) {
                layer5 = value;
              }, layer5Validator, layer5Controller)
            : Container(),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            TextWidget.textSubTitle('ขนาดของวัตถุดิบกระดาษ'),
          ],
        ),
        Row(
          children: [
            TextWidget.textSubTitle('หน่วย : ขนาดของวัตถุดิบกระดาษ'),
            const SizedBox(
              width: 20,
            ),
            DropdownButton(
              hint: const Text('เลือกหน่วย'),
              value: _selectedUnit,
              onChanged: (value) {
                setState(() {
                  _selectedUnit = value.toString();
                });
              },
              items: [
                const DropdownMenuItem(
                  value: 'cm',
                  child: Text('เซนติเมตร'),
                ),
                const DropdownMenuItem(
                  value: 'inch',
                  child: Text('นิ้ว'),
                ),
                const DropdownMenuItem(
                  value: 'm',
                  child: Text('เมตร'),
                ),
              ],
            ),
          ],
        ),
        Edittext.edittextNumber('ความกว้างของวัตถุดิบกระดาษ', '', (value) {
          try {
            width = double.parse(value);
          } catch (e) {}
        }, widthValidator, widthController),
        Edittext.edittextNumber('ความยาวของวัตถุดิบกระดาษ', '', (value) {
          try {
            height = double.parse(value);
          } catch (e) {}
        }, heightValidator, heightController),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            TextWidget.textSubTitle('ข้อมูลวัตถุดิบกระดาษ'),
          ],
        ),
        Edittext.edittextNumber('ราคาต่อแผ่น', 'บาท', (value) {
          try {
            price = double.parse(value);
          } catch (e) {}
        }, priceValidator, priceController),
        Edittext.edittextNumber('ขั้นต่ำในการสั่ง', 'แผ่น', (value) {
          try {
            minimum = int.parse(value);
          } catch (e) {}
        }, minimumValidator, minimumController),
        Edittext.edittextNumber('จัดส่งภายใน', 'วัน', (value) {
          try {
            deliverIndays = int.parse(value);
          } catch (e) {}
        }, deliverIndaysValidator, deliverIndaysController),
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

  Widget ronType() {
    return Column(
      children: [
        Row(
          children: [
            TextWidget.textSubTitle('ลอนกระดาษ'),
          ],
        ),
        Column(
          children: [
            RadioListTile(
              activeColor: brownDark,
              title: Text("E"),
              value: "E",
              groupValue: ron,
              onChanged: (value) {
                setState(() {
                  ron = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("B"),
              value: "B",
              groupValue: ron,
              onChanged: (value) {
                setState(() {
                  ron = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("C"),
              value: "C",
              groupValue: ron,
              onChanged: (value) {
                setState(() {
                  ron = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("BC"),
              value: "BC",
              groupValue: ron,
              onChanged: (value) {
                setState(() {
                  ron = value.toString();
                });
              },
            ),
          ],
        )
      ],
    );
  }
}
