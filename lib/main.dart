import 'package:firebase_core/firebase_core.dart';
import 'package:fit_flow/connection/network.dart';
import 'package:fit_flow/firebase_options.dart';
import 'package:fit_flow/pages/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
  Get.put(Internet(), permanent: true);
}
