import 'package:flutter/material.dart';
import 'package:testapp_aoi/main.dart';
import 'package:testapp_aoi/screen/Home/home_screen.dart';
import 'package:testapp_aoi/screen/auth/login_screen.dart';
import 'package:testapp_aoi/utils/extension/navExtension.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      if (prefs?.getString('token') != null) {
        context.pushAndRemoveUntil(view: HomeScreen());
      } else {
        context.pushAndRemoveUntil(view: const LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
