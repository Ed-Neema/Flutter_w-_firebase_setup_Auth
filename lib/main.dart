import 'package:firebase_auth_dbestech/auth_controller.dart';
import 'package:firebase_auth_dbestech/login_page.dart';
import 'package:firebase_auth_dbestech/signup_page.dart';
import 'package:firebase_auth_dbestech/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  // bind authcontroller to app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value)=> Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
