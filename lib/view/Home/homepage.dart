import 'package:boxseller/view/deliver/deliver.dart';
import 'package:boxseller/view/login/loginPage.dart';
import 'package:boxseller/view/purchase/purchase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/Palette.dart';
import '../../widget/button_app.dart';
import '../../widget/logo.dart';
import '../produce/produce.dart';
import '../sale/saleorder.dart';
import '../vender/vender.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget showWideget = SaleOrderPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 76, 60, 55),
        title: const Text('BOX SELLER'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              signOut();
            },
          )
        ],
      ),
      backgroundColor: Colors.brown[100],
      body: SafeArea(
          child: Stack(
        children: [
          menu(),
          Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height,
                  child: showWideget),
            ],
          ),
        ],
      )),
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
          ButtonApp.buttonMainWithIcon(context, 'รายการประเมินราคา', () {
            setState(() {
              showWideget = const SaleOrderPage();
            });
          }, Icons.aod),
          SizedBox(
            height: 10,
          ),
          ButtonApp.buttonMainWithIcon(context, 'รายการสั่งวัตถุดิบกระดาษ', () {
            setState(() {
              showWideget = const PurchasePage();
            });
          }, Icons.add_business_sharp),
          SizedBox(
            height: 10,
          ),
          ButtonApp.buttonMainWithIcon(context, 'รายการผลิต', () {
            setState(() {
              showWideget = const ProducePage();
            });
          }, Icons.factory),
          SizedBox(
            height: 10,
          ),
          ButtonApp.buttonMainWithIcon(context, 'รายการจัดส่ง', () {
            setState(() {
              showWideget = const DeliverPage();
            });
          }, Icons.local_shipping),
          SizedBox(
            height: 10,
          ),
          ButtonApp.buttonMainWithIcon(context, 'วัตถุดิบกระดาษ', () {
            setState(() {
              showWideget = VendorList();
            });
          }, Icons.account_tree_rounded),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       automaticallyImplyLeading: false,
  //       backgroundColor: Color.fromARGB(255, 76, 60, 55),
  //       title: const Text('BOX SELLER'),
  //       actions: <Widget>[
  //         IconButton(
  //           icon: const Icon(
  //             Icons.logout,
  //             color: Colors.white,
  //           ),
  //           onPressed: () {
  //             signOut();
  //           },
  //         )
  //       ],
  //     ),
  //     backgroundColor: Colors.brown[100],
  //     body: Row(
  //       children: [
  //         navigation(),
  //         Expanded(
  //           child: Container(
  //             child: Center(child: showWideget),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  Widget navigation() {
    return Container(
      width: 200,
      color: Colors.grey[200],
      child: ListView(
        children: [
          UIkit.logo(),
          ListTile(
            title: const Text('รายการประเมินราคา'),
            leading: const Icon(Icons.aod),
            onTap: () {
              setState(() {
                showWideget = const SaleOrderPage();
              });
            },
          ),
          ListTile(
            title: Text('รายการสั่งวัตถุดิบกระดาษ'),
            leading: Icon(Icons.add_business_sharp),
            onTap: () {
              setState(() {
                showWideget = const PurchasePage();
              });
            },
          ),
          ListTile(
            title: Text('รายการผลิต'),
            leading: Icon(Icons.factory),
            onTap: () {
              setState(() {
                showWideget = const ProducePage();
              });
            },
          ),
          ListTile(
            title: Text('รายการจัดส่ง'),
            leading: Icon(Icons.local_shipping),
            onTap: () {
              setState(() {
                showWideget = const DeliverPage();
              });
            },
          ),
          ListTile(
            title: Text('วัตถุดิบกระดาษ'),
            leading: Icon(Icons.account_tree_rounded),
            onTap: () {
              setState(() {
                showWideget = VendorList();
              });
            },
          ),
        ],
      ),
    );
  }
}

// class Navigation extends StatefulWidget {
//   @override
//   State<Navigation> createState() => _NavigationState();
// }

// class _NavigationState extends State<Navigation> {
//   Widget showWideget = const SaleOrderPage();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200,
//       color: Colors.grey[200],
//       child: ListView(
//         children: [
//           ListTile(
//             title: Text('รายการขาย'),
//             leading: Icon(Icons.home),
//             onTap: () {
//               setState(() {
//                 showWideget = const SaleOrderPage();
//               });
//             },
//           ),
//           ListTile(
//             title: Text('วัตถุดิบกระดาษ'),
//             leading: Icon(Icons.info),
//             onTap: () {
//               setState(() {
//                 showWideget = VendorList();
//               });
//             },
//           ),
//           ListTile(
//             title: Text('Services'),
//             leading: Icon(Icons.build),
//             onTap: () {},
//           ),
//           ListTile(
//             title: Text('Contact'),
//             leading: Icon(Icons.contact_mail),
//             onTap: () {},
//           ),
//           ListTile(
//             title: Text('FAQ'),
//             leading: Icon(Icons.question_answer),
//             onTap: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }
