import 'package:boxseller/model/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../get/getData.dart';
import '../../model/vender.dart';
import '../../widget/button_app.dart';
import '../../widget/text_widget.dart';
import 'materialInput.dart';

class VenderDetail extends StatefulWidget {
  Vender vender;
  VenderDetail({
    Key? key,
    required this.vender,
  }) : super(key: key);

  @override
  State<VenderDetail> createState() => _VenderDetailState();
}

class _VenderDetailState extends State<VenderDetail> {
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
                  TextWidget.textGeneral('ข้อมูล Vender'),
                  Card(
                      child: ListTile(
                    title: Text('ชื่อ Vender : ${widget.vender.name}'),
                    subtitle: Text(
                        'ที่อยู่ : ${widget.vender.address}\n โทร :${widget.vender.tel}'),
                    trailing: const Icon(
                      Icons.house_outlined,
                      color: Colors.brown,
                      size: 36.0,
                    ),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonApp.buttonMain(context, ' + วัตถุดิบกระดาษใหม่ ',
                      () async {
                    var res = await Get.to(MeaterialInput(
                      vender: widget.vender,
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
    return FutureBuilder<List<MaterialPaper>>(
      future: GetData().getDataMaterialsByVender(widget.vender.id!),
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
                  title: Text(
                      '${snapshot.data![index].layer1} ${snapshot.data![index].layer2} ${snapshot.data![index].layer3} ${snapshot.data![index].layer4} ${snapshot.data![index].layer5}'),
                  subtitle:
                      Text('วัตถุดิบกระดาษ : ${snapshot.data![index].id}'),
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
