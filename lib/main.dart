import 'package:boxseller/view/Home/homepage.dart';
import 'package:boxseller/view/login/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:path_provider/path_provider.dart';

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // initialize path_provider
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isLogin = false;
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        isLogin = false;
      } else {
        isLogin = true;
        print('User is signed in!');
        Get.to(HomePage());
      }
    });
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.brown)
            .copyWith(secondary: Colors.green), // กำหนดสี accent ของแอปพลิเคชัน
      ),
      home: const LoginPage(),
    );
  }
}
