import 'package:boxseller/Utils/Palette.dart';
import 'package:boxseller/model/order.dart';
import 'package:boxseller/widget/edittext.dart';
import 'package:boxseller/widget/logo.dart';
import 'package:boxseller/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/button_app.dart';

class BoxInputPage extends StatefulWidget {
  const BoxInputPage({super.key});

  @override
  State<BoxInputPage> createState() => _BoxInputPageState();
}

class _BoxInputPageState extends State<BoxInputPage> {
  late String name;
  late String tel;

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
                    customerForm(),
                    lineSep(),
                    productForm(),
                    lineSep(),
                    boxForm(),
                    lineSep(),
                    decoForm(),
                    ButtonApp.buttonMain(context, 'คำนวราคาเเละวัตถุดิบกระดาษ',
                        () {
                      BoxOrder newOrder = BoxOrder(
                          id: '',
                          name: name,
                          weightProduct: 123.4,
                          widthBox: 123.4,
                          longBox: 123.4,
                          heightBox: 123.4,
                          unit: 1,
                          orderAmount: 200,
                          isHumidityProduct: 1,
                          isHumidityWarehouse: 1,
                          amount_stack_warehouse: 1,
                          useDesignService: 1,
                          isSharpPrint: 1,
                          isUseColorOver: true,
                          artwork: 'artwork',
                          isDeliveryProduct: 1,
                          widthTemplate: 100,
                          heightTeplate: 100,
                          empId: '21',
                          status: 'true');
                      newOrder.newOrder();
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

  Widget customerForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            TextWidget.textGeneral('ข้อมูลลูกค้า'),
          ],
        ),
        // Edittext.edittextGeneral('ชื่อลูกค้า', '', (value) {
        //   name = value;
        // }),
        // Edittext.edittextGeneral('เบอร์โทรศัพท์', '', (value) {
        //   name = value;
        // }),
        // Edittext.textAreaGeneral('ที่อยู่', '', (value) {}),
      ],
    );
  }

  Widget productForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            TextWidget.textGeneral('ข้อมูลผลิตภัณฑ์'),
          ],
        ),
        // Edittext.edittextGeneral('ชื่อผลิตภัณฑ์', ''),
        // Edittext.edittextGeneral('น้ำหนักของผลิตภัณฑ์', ''),
        // Edittext.edittextGeneral('หน่วย', ''),
        deliveryCheck(),
        moistureProductCheck(),
        moistureWarehouseCheck(),
        isStackCheck(),
        concernInCheck()
      ],
    );
  }

  Widget boxForm() {
    return Column(
      children: [
        TextWidget.textGeneral('ข้อมูลบรรจุภัณฑ์ที่ต้องการสั่งผลิต'),
        // Edittext.edittextGeneral('จำนวนที่ต้องการสั่งผลิต (ชิ้น)', ''),
        // paperType(),
        // Edittext.edittextGeneral('กว้าง', ''),
        // Edittext.edittextGeneral('ยาว', ''),
        // Edittext.edittextGeneral('สูง', ''),
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

  String? gender;
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
              title: Text("มี"),
              value: "1",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("ไม่มี"),
              value: "0",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
          ],
        )
      ],
    );
  }

  String? moistureProduct;
  Widget moistureProductCheck() {
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
              title: Text("ชื้น"),
              value: "2",
              groupValue: moistureProduct,
              onChanged: (value) {
                setState(() {
                  moistureProduct = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("เล็กน้อย"),
              value: "1",
              groupValue: moistureProduct,
              onChanged: (value) {
                setState(() {
                  moistureProduct = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("ไม่ชื้น"),
              value: "0",
              groupValue: moistureProduct,
              onChanged: (value) {
                setState(() {
                  moistureProduct = value.toString();
                });
              },
            ),
          ],
        )
      ],
    );
  }

  String? moistureWarehouse;
  Widget moistureWarehouseCheck() {
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
              title: Text("ชื้น"),
              value: "1",
              groupValue: moistureWarehouse,
              onChanged: (value) {
                setState(() {
                  moistureWarehouse = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("ไม่ชื้น"),
              value: "0",
              groupValue: moistureWarehouse,
              onChanged: (value) {
                setState(() {
                  moistureWarehouse = value.toString();
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
          title: Text("ซ้อนกันในคลังที่จัดเก็บมากกว่า 5 ชิ้น"),
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

  String? concernIn;
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
              value: "1",
              groupValue: concernIn,
              onChanged: (value) {
                setState(() {
                  concernIn = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("เน้นความเเข็งเเรง"),
              value: "0",
              groupValue: concernIn,
              onChanged: (value) {
                setState(() {
                  concernIn = value.toString();
                });
              },
            ),
          ],
        )
      ],
    );
  }

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
              groupValue: concernIn,
              onChanged: (value) {
                setState(() {
                  concernIn = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("KK"),
              value: "KK",
              groupValue: concernIn,
              onChanged: (value) {
                setState(() {
                  concernIn = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("KA"),
              value: "KA",
              groupValue: concernIn,
              onChanged: (value) {
                setState(() {
                  concernIn = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("KL"),
              value: "KL",
              groupValue: concernIn,
              onChanged: (value) {
                setState(() {
                  concernIn = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("KI"),
              value: "KI",
              groupValue: concernIn,
              onChanged: (value) {
                setState(() {
                  concernIn = value.toString();
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

  String? deco;
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
              value: "2",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("มีลวดลายเเล้ว"),
              value: "1",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: brownDark,
              title: Text("ไม่พิมพ์ลวดลาย"),
              value: "0",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
          ],
        )
      ],
    );
  }
}
