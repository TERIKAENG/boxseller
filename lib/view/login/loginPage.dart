import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/Palette.dart';
import '../../get/algorithm.dart';
import '../../widget/button_app.dart';
import '../../widget/edittext.dart';
import '../Home/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String username;
  late String password;

  bool isValidUsername = false;
  bool isValidpassword = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        background(),
        Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 20.0,
              ),
            ],
          ),
          margin: const EdgeInsets.fromLTRB(290, 150, 290, 150),
          child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [banner(), Center(child: loginForm())]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
          child: logo(),
        )
      ],
    );
  }

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  Widget loginForm() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Column(
            children: [
              Edittext.edittextGeneral('บัญชีผู้ใช้', '', (value) {
                username = value;
              }, isValidUsername, usernameController),
              Edittext.edittextGeneral('รหัสผ่าน', '', (value) {
                password = value;
              }, isValidpassword, passwordController),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              ButtonApp.buttonMain(context, 'เข้าสู่ระบบ', () {
                Get.to(const HomePage());
              })
            ],
          ),
        ),
      ],
    );
  }

  Widget logo() {
    return Flexible(
      child: Image.asset(
        'asset/images/logo.png',
      ),
    );
  }

  Widget banner() {
    return Flexible(
      child: Image.asset(
        'asset/images/login.png',
      ),
    );
  }

  Widget background() {
    return Column(
      children: [
        Container(
          height: 50,
          color: brownDark,
        ),
        Container(
          height: 300,
          color: brownlight,
        )
      ],
    );
  }
}
