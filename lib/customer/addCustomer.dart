import 'package:boxseller/Utils/Palette.dart';
import 'package:boxseller/model/customer.dart';
import 'package:boxseller/model/order.dart';
import 'package:boxseller/widget/edittext.dart';
import 'package:boxseller/widget/logo.dart';
import 'package:boxseller/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/button_app.dart';

class NewCustomer extends StatefulWidget {
  const NewCustomer({super.key});

  @override
  State<NewCustomer> createState() => _NewCustomerState();
}

class _NewCustomerState extends State<NewCustomer> {
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
                    ButtonApp.buttonMain(context, 'เพิ่มลูกค้าใหม่',
                        () {
                      if (name != '' && tel != '' && address != '') {
                        Customer newCustomer =
                            Customer(name: name, tel: tel, address: address);
                        newCustomer.newCustomer();
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
        Edittext.edittextGeneral('ชื่อลูกค้า', '', (value) {
          name = value;
        }, isValidName),
        Edittext.edittextGeneral('เบอร์โทรศัพท์', '', (value) {
          tel = value;
        }, isValidTel),
        Edittext.textAreaGeneral('ที่อยู่', '', (value) {
          address = value;
        }, isValidAddress),
      ],
    );
  }
}
