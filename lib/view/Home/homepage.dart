import 'package:flutter/material.dart';

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
        title: Text('My App'),
      ),
      backgroundColor: Colors.brown[100],
      body: Row(
        children: [
          navigation(),
          Expanded(
            child: Container(
              child: Center(child: showWideget),
            ),
          ),
        ],
      ),
    );
  }

  Widget navigation() {
    return Container(
      width: 200,
      color: Colors.grey[200],
      child: ListView(
        children: [
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
            title: Text('วัตถุดิบกระดาษ'),
            leading: Icon(Icons.report),
            onTap: () {
              setState(() {
                showWideget = VendorList();
              });
            },
          ),
          ListTile(
            title: Text('รายการสั่งผลิต'),
            leading: Icon(Icons.report),
            onTap: () {
              setState(() {
                showWideget = VendorList();
              });
            },
          ),
          // ListTile(
          //   title: Text('Contact'),
          //   leading: Icon(Icons.contact_mail),
          //   onTap: () {},
          // ),
          // ListTile(
          //   title: Text('FAQ'),
          //   leading: Icon(Icons.question_answer),
          //   onTap: () {},
          // ),
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
