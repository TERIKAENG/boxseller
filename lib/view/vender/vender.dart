import 'package:boxseller/view/vender/materialInput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../get/getData.dart';
import '../../model/material.dart';
import '../../model/vender.dart';

class VendorList extends StatefulWidget {
  @override
  _VendorListState createState() => _VendorListState();
}

class _VendorListState extends State<VendorList> {
  // ข้อมูล Vendor
  var vendors = [];

  // เปิดหน้าเพิ่ม Vendor
  void _addVendor() {
    var result = Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddVendor()));
    if (result == true) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายการผู้ขายวัตถุดิบกระดาษ'),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 160, 133, 105),
      ),
      body: FutureBuilder<List<Vender>>(
          future: GetData().getDataVenders(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  vendors = snapshot.data!;
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data![index].name),
                      subtitle: Text(
                          'ที่อยู่ : ${snapshot.data![index].address}\n โทร :${snapshot.data![index].tel}'),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_circle_right),
                        onPressed: () {
                          // เปิดหน้าแสดงวัตถุดิบกระดาษ
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => PaperIngredients(
                          //         vendorUrl: vendors[index]
                          //             ['paperIngredients']!),
                          //   ),
                          // );
                        },
                      ),
                      onTap: () {
                        // ข้อมูล Vendor ที่ถูกเลือก
                        Vender selectedVendor = vendors[index];

                        // เปิดหน้าแสดงรายละเอียด Vendor
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    VendorDetails(vender: selectedVendor)));
                      },
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Center(
                child: Container(
                    width: 200,
                    height: 200,
                    child: const CircularProgressIndicator()));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _addVendor,
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddVendor extends StatefulWidget {
  @override
  State<AddVendor> createState() => _AddVendorState();
}

class _AddVendorState extends State<AddVendor> {
  String name = '';

  String tel = '';

  String address = '';

  bool isValidName = true;

  bool isValidTel = true;

  bool isValidAddress = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เพิ่มผู้ขายวัตถุดิบกระดาษ'),
        backgroundColor: Color.fromARGB(255, 160, 133, 105),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.brown[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  errorText: isValidName ? null : 'กรุณากรอกชื่อผู้ขาย',
                  labelText: 'ชื่อผู้ขาย',
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (value) {
                  name = value;
                },
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  errorText: isValidTel ? null : 'กรุณากรอกเบอร์โทรศัพท์',
                  labelText: 'เบอร์โทรศัพท์',
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (value) {
                  tel = value;
                },
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  errorText: isValidAddress ? null : 'กรุณากรอกที่อยู่',
                  labelText: 'ที่อยู่',
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (value) {
                  address = value;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (name != '' && tel != '' && address != '') {
                    Vender newVender =
                        Vender(name: name, tel: tel, address: address);
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
                },
                child: Text('เพิ่มผู้ขายวัตถุดิบกระดาษใหม่'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown[700],
                  onPrimary: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VendorDetails extends StatefulWidget {
  final Vender vender;

  VendorDetails({required this.vender});

  @override
  State<VendorDetails> createState() => _VendorDetailsState();
}

class _VendorDetailsState extends State<VendorDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 76, 60, 55),
        title: Text('ผู้ขายวัตถุดิบกระดาษ'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ชื่อผู้ขาย: ${widget.vender.name}',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'เบอร์โทรศัพท์: ${widget.vender.tel}',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'ที่อยู่:',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.vender.address,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 32.0),
            Text(
              'รายการวัตถุดิบกระดาษ:',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            FutureBuilder<List<MaterialPaper>>(
                future: GetData().getDataMaterialsByVender(widget.vender.id!),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white,
                            child: ListTile(
                              title: Text(
                                '${snapshot.data![index].layer1} ${snapshot.data![index].layer2} ${snapshot.data![index].layer3} ${snapshot.data![index].layer4} ${snapshot.data![index].layer5}',
                                style: TextStyle(fontSize: 20.0),
                              ),
                              subtitle:  Text('วัตถุดิบกระดาษ ขนาด : ${snapshot.data![index].widthPaper} x ${snapshot.data![index].heightPaper}\nราคา ${snapshot.data![index].pricePaper} บาท',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return Center(
                      child: Container(
                          width: 200,
                          height: 200,
                          child: const CircularProgressIndicator()));
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var res = await Get.to(MeaterialInput(
            vender: widget.vender,
          ));
          if (res) {
            setState(() {});
          }
        },
        tooltip: 'Add Material',
        child: Icon(Icons.add),
      ),
    );
  }
}
