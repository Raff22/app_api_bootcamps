import 'package:flutter/material.dart';
import 'package:testapp_aoi/screen/auth/login_screen.dart';
import 'package:testapp_aoi/screen/auth/registration_screen.dart';
import 'package:testapp_aoi/screen/auth/verification_screen%20copy.dart';
import 'package:testapp_aoi/screen/Home/home_screen.dart';
import 'package:testapp_aoi/screen/loading_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(home: RegistrationScreen());
    return const MaterialApp(home: LoadingScreen());
  }
}
