// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:testapp_aoi/main.dart';
import 'package:testapp_aoi/repository/auth_method_networking.dart';
import 'package:testapp_aoi/screen/Home/home_screen.dart';
import 'package:testapp_aoi/utils/extension/navExtension.dart';
import 'package:testapp_aoi/utils/extension/screenExtension.dart';
import 'package:testapp_aoi/utils/method_widget/alertError_widget.dart';
import 'package:testapp_aoi/utils/method_widget/show_loading_widget.dart';

enum TypeOfAuth { registration, login, rest }

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({
    super.key,
    required this.email,
    required this.type,
  });

  final String email;
  final TypeOfAuth type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: ListView(children: [
        Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              SizedBox(
                height: context.getWidth(divide: 3),
                width: context.getWidth(),
                child: Image.asset('assets/check-mail.png'),
              ),
              SizedBox(
                height: context.getWidth(divide: 6),
              ),
              const Text(
                "Confirm your:",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  email.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )),
        SizedBox(
          height: context.getWidth(divide: 10),
        ),
        Center(
          child: Pinput(
            length: 6,
            onCompleted: (pin) async {
              loadingWidget(context: context);
              AuthMethodNetworking methodAPI = AuthMethodNetworking();
              Map<String, dynamic> bodyMap = {
                "otp": pin.toString(),
                "email": email,
                "type": type.name
              };
              final results = await methodAPI.verificationMethod(body: bodyMap);
              if (results.codeState == 200) {
                prefs?.setString("token", results.data!.token);
                Navigator.pop(context);
                context.pushAndRemoveUntil(view: HomeScreen());
              } else {
                Navigator.pop(context);
                alertError(context: context, msg: results.msg);
              }
            },
          ),
        )
      ])),
    );
  }
}
