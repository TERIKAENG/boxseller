import 'package:flutter/material.dart';

import '../../get/getData.dart';
import '../../model/vender.dart';

class VendorList extends StatefulWidget {
  @override
  _VendorListState createState() => _VendorListState();
}

class _VendorListState extends State<VendorList> {
  // ข้อมูล Vendor
  List<Map<String, String>> vendors = [
    {
      'name': 'Vendor A',
      'address': '123 Main St, Anytown, USA',
      'phone': '555-1234'
    },
    {
      'name': 'Vendor B',
      'address': '456 Elm St, Anytown, USA',
      'phone': '555-5678'
    },
    {
      'name': 'Vendor C',
      'address': '789 Oak St, Anytown, USA',
      'phone': '555-9012'
    },
  ];

  // เปิดหน้าเพิ่ม Vendor
  void _addVendor() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddVendor()));
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
                itemCount: vendors.length,
                itemBuilder: (context, index) {
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
                        Map<String, String> selectedVendor = vendors[index];

                        // เปิดหน้าแสดงรายละเอียด Vendor
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    VendorDetails(vendor: selectedVendor)));
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

class AddVendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Vendor'),
      ),
      body: Center(
        child: Text('Add Vendor'),
      ),
    );
  }
}

class VendorDetails extends StatelessWidget {
  final Map<String, String> vendor;

  VendorDetails({required this.vendor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vendor['name']!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(vendor['address']!),
            Text(vendor['phone']!),
          ],
        ),
      ),
    );
  }
}
