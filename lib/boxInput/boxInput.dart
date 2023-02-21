import 'package:boxseller/Utils/Palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widget/edittext.dart';
import '../widget/text_widget.dart';

class BoxInputPage extends StatefulWidget {
  const BoxInputPage({super.key});

  @override
  State<BoxInputPage> createState() => _BoxInputPageState();
}

class _BoxInputPageState extends State<BoxInputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.fromLTRB(400, 50, 400, 50),
      child: ListView(
        children: [
          header(),
          customerForm(),
          lineSep(),
          productForm()
        ],
      ),
    )));
  }

  Widget header() {
    return TextWidget.textGeneral('รายการสั่งผลิตใหม่');
  }

  Widget customerForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextWidget.textGeneral('ข้อมูลลูกค้า'),
        Edittext.edittextGeneral('ชื่อลูกค้า', ''),
        Edittext.edittextGeneral('เบอร์โทรศัพท์', ''),
        Edittext.textAreaGeneral('ที่อยู่', ''),
      ],
    );
  }

  Widget productForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextWidget.textGeneral('ข้อมูลผลิตภัณฑ์'),
        Edittext.edittextGeneral('ชื่อผลิตภัณฑ์', ''),
        Edittext.edittextGeneral('น้ำหนักของผลิตภัณฑ์', ''),

      ],
    );
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




  Widget deliveryCheck(){
    return Column(
      children: [
        TextWidget.textSubTitle('บรรจุภัณฑ์ต้องผ่านกระบวนการจัดส่ง'),
        
      ],
    );
  }
}
