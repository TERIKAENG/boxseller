import 'package:flutter/material.dart';

import '../vender/testvender.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget showWideget = VendorList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 76, 60, 55),
        title: Text('My App'),
      ),
      backgroundColor: Colors.brown[100],
      body: Row(
        children: [
          Navigation(),
          Expanded(
            child: Container(
              child: Center(
                child: showWideget
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.grey[200],
      child: ListView(
        children: [
          ListTile(
            title: Text('รายการขาย'),
            leading: Icon(Icons.home),
            onTap: () {},
          ),
          ListTile(
            title: Text('วัตถุดิบกระดาษ'),
            leading: Icon(Icons.info),
            onTap: () {},
          ),
          ListTile(
            title: Text('Services'),
            leading: Icon(Icons.build),
            onTap: () {},
          ),
          ListTile(
            title: Text('Contact'),
            leading: Icon(Icons.contact_mail),
            onTap: () {},
          ),
          ListTile(
            title: Text('FAQ'),
            leading: Icon(Icons.question_answer),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
