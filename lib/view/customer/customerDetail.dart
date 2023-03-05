import 'package:boxseller/model/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../get/getData.dart';
import '../../model/customer.dart';
import '../../widget/button_app.dart';
import '../../widget/text_widget.dart';
import '../boxInput/boxInput.dart';

class CustomerDetail extends StatefulWidget {
  Customer customer;
  CustomerDetail({
    Key? key,
    required this.customer,
  }) : super(key: key);

  @override
  State<CustomerDetail> createState() => _CustomerDetailState();
}

class _CustomerDetailState extends State<CustomerDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height,
            child: ListView(children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextWidget.textGeneral('ข้อมูลลูกค้า'),
                  Card(
                      child: ListTile(
                    title: Text('ชื่อลูกค้า : ${widget.customer.name}'),
                    subtitle: Text(
                        'ที่อยู่ : ${widget.customer.address}\n โทร :${widget.customer.tel}'),
                    trailing: const Icon(
                      Icons.house_outlined,
                      color: Colors.brown,
                      size: 36.0,
                    ),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonApp.buttonMain(context, ' + สั่งผลิต ', () async {
                    var res = await Get.to(BoxInputPage(
                      customer: widget.customer,
                    ));
                    if (res) {
                      setState(() {});
                    }
                  }),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.6,
                      padding: const EdgeInsets.fromLTRB(10, 100, 10, 0),
                      child: detail()),
                ],
              ),
            ]),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height)
        ],
      )),
    );
  }

  Widget detail() {
    return FutureBuilder<List<BoxOrder>>(
      future: GetData().getDataOrderByCustomer(widget.customer.id!),
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
                  // Get.to(CustomerDetail(
                  //   customer: snapshot.data![index],
                  // ));
                },
                child: Card(
                    child: ListTile(
                  title: Text('ออเดอร์ : ${snapshot.data![index].id}'),
                  subtitle: Text(
                      snapshot.data![index].name),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.brown,
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
    );
  }
}
