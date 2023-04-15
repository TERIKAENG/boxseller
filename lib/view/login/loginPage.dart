import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Home/homepage.dart';
import '../Home/homepage_temp.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controllerEmail = TextEditingController(text: '');
    var controllerPassword = TextEditingController(text: '');

    return Scaffold(
      body: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("asset/images/login.png"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Center(
          child: Container(
            width: 400,
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "BOX SELLER",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: controllerEmail,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'บัญชีผู้ใช้',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: controllerPassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'รหัสผ่าน',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (controllerEmail.text != '' &&
                        controllerPassword.text != '') {
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: controllerEmail.text,
                                password: controllerPassword.text);
                        print(credential.toString());
                        if (credential != null) {
                          Get.to(HomePage());
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');

                          const snackBar = SnackBar(
                            content: Text('ไม่พบบัญชีผู้ใช้'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                          const snackBar = SnackBar(
                            content: Text('รหัสผ่านไม่ถูกต้อง'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (e.code == 'invalid-email') {
                          print(e.code);
                          const snackBar = SnackBar(
                            content: Text('กรุณากรอกบัญชีผู้ใช้ให้ถูกต้อง'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          print(e.code);
                          const snackBar = SnackBar(
                            content: Text('กรุณากรอกบัญชีผู้ใช้ให้ถูกต้อง'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                    } else {
                      const snackBar = SnackBar(
                        content: Text('กรุณากรอกบัญชีผู้ใช้และรหัสผ่าน'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    textStyle: const TextStyle(fontSize: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
