// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:boxseller/Utils/Palette.dart';
import 'package:boxseller/model/customer.dart';
import 'package:boxseller/model/order.dart';
import 'package:boxseller/widget/edittext.dart';
import 'package:boxseller/widget/logo.dart';
import 'package:boxseller/widget/text_widget.dart';

import '../../widget/button_app.dart';

class EditCustomer extends StatefulWidget {
  Customer customer;

  EditCustomer({
    Key? key,
    required this.customer,
  }) : super(key: key);

  @override
  State<EditCustomer> createState() => _EditCustomerState();
}

class _EditCustomerState extends State<EditCustomer> {
  String name = '';
  String tel = '';
  String address = '';

  bool isValidName = true;
  bool isValidTel = true;
  bool isValidAddress = true;

  @override
  void initState() {
    super.initState();

    name = widget.customer.name;
    nameController.text = name;

    tel = widget.customer.tel;
    telController.text = tel;

    address = widget.customer.address;
    addressController.text = address;
  }

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
                    ButtonApp.buttonMain(context, 'อัพเดทข้อมูลลูกค้าใหม่',
                        () async {
                      if (name != '' && tel != '' && address != '') {
                        Customer newCustomer =
                            Customer(name: name, tel: tel, address: address);
                        newCustomer.id = widget.customer.id;
                        await newCustomer.updateCustomer();
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
    return TextWidget.textGeneral('รายการสั่งผลิตใหม่');
  }

  var nameController = TextEditingController();
  var telController = TextEditingController();
  var addressController = TextEditingController();

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
