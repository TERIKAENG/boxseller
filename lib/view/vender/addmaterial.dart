import 'package:flutter/material.dart';

class AddMaterial extends StatefulWidget {
  @override
  _AddMaterialState createState() => _AddMaterialState();
}

class _AddMaterialState extends State<AddMaterial> {
  final _formKey = GlobalKey<FormState>();
  String _layer1 = '';
  String _layer2 = '';
  String _layer3 = '';
  String _layer4 = '';
  String _layer5 = '';
  double _width = 0.0;
  double _length = 0.0;
  double _pricePerSheet = 0.0;
  int _minimumOrder = 0;
  int _deliveryTime = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Order Form'),
        ),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                          decoration: InputDecoration(
                        labelText: 'Layer 1',
                        labelStyle: TextStyle(
                          color: Colors.brown[700], // กำหนดสี label text
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.brown, // กำหนดสี border เมื่อ widget อยู่ในสถานะปกติ
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.brown, // กำหนดสี border เมื่อ widget ได้รับการเลือก
                            width: 2.0,
                          ),
                        ),
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red, // กำหนดสี border เมื่อ widget มีข้อผิดพลาด
                          ),
                        ),
                        focusedErrorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red, // กำหนดสี border เมื่อ widget มีข้อผิดพลาดและได้รับการเลือก
                            width: 2.0,
                          ),
                        ),
                        fillColor: Colors.brown[50], // กำหนดสีพื้นหลังของ
                      ))
                    ]))));
  }
}
