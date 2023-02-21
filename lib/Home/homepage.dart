import 'package:boxseller/Utils/Palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widget/button_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Stack(
          children: [menu(), detail()],
        ),
      )),
    );
  }

  Widget detail() {
    return ListView.builder(
       // itemCount: titles.length,
          itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
                  title: Text('titles[index]'),
                  subtitle: Text(subtitles[index]),
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                  trailing: Icon(icons[index])));
        });
  }

  Widget menu() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height,
      color: greyBorder,
      child: Column(
        children: [
          logo(),
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

  Widget logo() {
    return Flexible(
      child: Image.asset(
        'asset/images/logo.png',
      ),
    );
  }
}
