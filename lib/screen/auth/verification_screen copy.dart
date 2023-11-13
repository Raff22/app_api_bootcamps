import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:testapp_aoi/screen/Home/home_screen.dart';
import 'package:testapp_aoi/utils/extension/navExtension.dart';
import 'package:testapp_aoi/utils/extension/screenExtension.dart';

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
            onCompleted: (pin) {
              context.pushAndRemoveUntil(view: HomeScreen());
            },
          ),
        )
      ])),
    );
  }
}
