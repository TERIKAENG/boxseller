import 'package:boxseller/model/vender.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../Utils/Palette.dart';
import '../../model/customer.dart';
import '../../widget/button_app.dart';
import '../../widget/edittext.dart';
import '../../widget/logo.dart';
import '../../widget/text_widget.dart';

class NewVender extends StatefulWidget {
  const NewVender({super.key});

  @override
  State<NewVender> createState() => _NewVenderState();
}

class _NewVenderState extends State<NewVender> {
  String name = '';
  String tel = '';
  String address = '';

  bool isValidName = true;
  bool isValidTel = true;
  bool isValidAddress = true;

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
                    ButtonApp.buttonMain(context, 'เพิ่ม vender ใหม่', () {
                      if (name != '' && tel != '' && address != '') {
                        Vender newVender = Vender(
                            name: name,
                            tel: tel,
                            address: address);
                        newVender.newVender();
                        Navigator.pop(context, true);
                      } else {
                        if (name == '') {
                          setState(() {
                            isValidName = false;
                          });
                        }
                        if (tel == '') {
                          setState(() {
                            isValidTel = false;
                          });
                        }
                        if (address == '') {
                          setState(() {
                            isValidAddress = false;
                          });
                        }
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
    return TextWidget.textGeneral('เพิ่ม Vender ใหม่');
  }

  var nameController = TextEditingController();
  var telController = TextEditingController();
  var addressController = TextEditingController();
  var deliverInDaysController = TextEditingController();

  Widget customerForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            TextWidget.textGeneral('ข้อมูล Vender'),
          ],
        ),
        Edittext.edittextGeneral('ชื่อ Vender', '', (value) {
          name = value;
        }, isValidName, nameController),
        Edittext.edittextGeneral('เบอร์โทรศัพท์', '', (value) {
          tel = value;
        }, isValidTel, telController),
        Edittext.textAreaGeneral('ที่อยู่', '', (value) {
          address = value;
        }, isValidAddress, addressController),
      ],
    );
  }
}
