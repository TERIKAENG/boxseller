import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../get/getData.dart';
import '../../model/customer.dart';
import '../customer/addCustomer.dart';
import '../customer/customerDetail.dart';

class ProducePage extends StatefulWidget {
  const ProducePage({super.key});

  @override
  State<ProducePage> createState() => _ProducePageState();
}

class _ProducePageState extends State<ProducePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายการการผลิต'),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 160, 133, 105),
      ),
      body: FutureBuilder<List<Customer>>(
        future: GetData().getDataCustomers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                // if (index == 0) {
                //   return ButtonApp.buttonMain(context, '+ ลูกค้าใหม่', () {
                //     Get.to(const NewCustomer());
                //   });
                // }
                return GestureDetector(
                  onTap: () {
                    Get.to(CustomerDetail(
                      customer: snapshot.data![index],
                    ));
                  },
                  child: Card(
                      child: ListTile(
                    title: Text('ชื่อลูกค้า : ${snapshot.data![index].name}'),
                    subtitle: Text(
                        'ที่อยู่ : ${snapshot.data![index].address}\n โทร :${snapshot.data![index].tel}'),
                    trailing: const Icon(
                      Icons.arrow_circle_right,
                      size: 36.0,
                    ),
                  )),
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
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

           var res = await Get.to(const NewCustomer());
            if (res) {
              setState(() {});
            }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Widget menu() {
  //   return Container(
  //     width: MediaQuery.of(context).size.width * 0.2,
  //     height: MediaQuery.of(context).size.height,
  //     color: greyBorder,
  //     child: Column(
  //       children: [
  //         UIkit.logo(),
  //         ButtonApp.buttonSecondary(context, 'การขาย', () {
  //           //Get.to(const HomePage());
  //         }),
  //         const SizedBox(
  //           height: 20,
  //         ),
  //         ButtonApp.buttonMain(context, 'Vender', () {
  //           Navigator.pushReplacement(
  //             context,
  //             PageRouteBuilder(
  //               pageBuilder: (context, animation1, animation2) => const VenderHome(),
  //               transitionDuration: Duration.zero,
  //               reverseTransitionDuration: Duration.zero,
  //             ),
  //           );
  //         }),
  //       ],
  //     ),
  //   );
}
