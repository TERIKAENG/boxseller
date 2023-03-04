import 'package:boxseller/Utils/Palette.dart';
import 'package:boxseller/get/getData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../boxInput/boxInput.dart';
import '../customer/addCustomer.dart';
import '../model/customer.dart';
import '../widget/button_app.dart';
import '../widget/logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Customer> listData = [];

 
  @override
  Widget build(BuildContext context) {
        await GetData().getDataCustomers().then((value) {
      listData = value;
    }).catchError((error) {
      print('error : $error');
    });
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Stack(
          children: [
            menu(),
            Container(
                height: 1000,
                padding: const EdgeInsets.fromLTRB(350, 100, 350, 0),
                child: detail())
          ],
        ),
      )),
    );
  }

  Widget detail() {
    return ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return ButtonApp.buttonMain(context, '+ ลูกค้าใหม่', () {
              Get.to(const NewCustomer());
            });
          }
          return Card(
              child: ListTile(
            title: Text('titles${listData[index-1].name}'),
            // subtitle: Text(subtitles[index]),
            // leading: CircleAvatar(
            //     backgroundImage: NetworkImage(
            //         "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
            // trailing: Icon(icons[index])
          ));
        });
  }

  Widget menu() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height,
      color: greyBorder,
      child: Column(
        children: [
          UIkit.logo(),
          ButtonApp.buttonMain(context, 'ประเมินราคา', () {
            //Get.to(const HomePage());
          }),
          const SizedBox(
            height: 20,
          ),
          ButtonApp.buttonMain(context, 'รายการคำสั่งซื้อ', () {
            //Get.to(const HomePage());
          }),
        ],
      ),
    );
  }
}
