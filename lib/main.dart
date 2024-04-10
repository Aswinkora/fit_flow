import 'package:firebase_core/firebase_core.dart';
import 'package:fit_flow/firebase_options.dart';
import 'package:fit_flow/pages/bodypart.dart';
// import 'package:fit_flow/pages/splashscreen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Bodypart (),
  ));
}
