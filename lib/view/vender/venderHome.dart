import 'package:boxseller/Utils/Palette.dart';
import 'package:boxseller/view/vender/newVender.dart';
import 'package:boxseller/view/vender/venderDetial.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../get/getData.dart';
import '../../model/vender.dart';
import '../../widget/button_app.dart';
import '../../widget/logo.dart';
import '../../widget/text_widget.dart';
import '../Home/homepage.dart';
import '../Home/homepage_temp.dart';
import 'materialInput.dart';


class VenderHome extends StatefulWidget {
  const VenderHome({super.key});

  @override
  State<VenderHome> createState() => _VenderHomeState();
}

class _VenderHomeState extends State<VenderHome> {

  @override
  Widget build(BuildContext context) {
 return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              menu(),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.21,
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      Center(child: header()),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          width: MediaQuery.of(context).size.width * 0.6,
                          padding: const EdgeInsets.fromLTRB(10, 100, 10, 0),
                          child: detail()),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }

  Widget header() {
    return Row(
      children: [
        TextWidget.textGeneral('รายการ Vender'),
        const SizedBox(
          width: 25,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.1,
          child: ButtonApp.buttonMain(context, ' + Vender ใหม่', () async {
            var res = await Get.to(const NewVender());
            if (res) {
              setState(() {});
            }
          }),
        ),
      ],
    );
  }

  Widget detail() {
    return FutureBuilder<List<Vender>>(
      future: GetData().getDataVenders(),
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
                  Get.to(VenderDetail(
                    vender: snapshot.data![index],
                  ));
                },
                child: Card(
                    child: ListTile(
                  title: Text('Vender : ${snapshot.data![index].name}'),
                  subtitle: Text(
                      'ที่อยู่ : ${snapshot.data![index].address}\n โทร :${snapshot.data![index].tel}'),
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

  Widget menu() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height,
      color: greyBorder,
      child: Column(
        children: [
          UIkit.logo(),
          ButtonApp.buttonMain(context, 'การขาย', () {
              Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>  HomePage(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          }),
          const SizedBox(
            height: 20,
          ),
          ButtonApp.buttonSecondary(context, 'Vender', () {
            //Get.to(const HomePage());
          }),
        ],
      ),
    );
  }
}