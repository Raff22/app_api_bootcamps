// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:testapp_aoi/repository/auth_method_networking.dart';
import 'package:testapp_aoi/screen/Home/home_screen.dart';
import 'package:testapp_aoi/screen/auth/registration_screen.dart';
import 'package:testapp_aoi/screen/auth/verification_screen.dart';
import 'package:testapp_aoi/screen/auth/widgets_auth/auth_felid.dart';
import 'package:testapp_aoi/screen/auth/widgets_auth/ButtonAuth.dart';
import 'package:testapp_aoi/utils/extension/navExtension.dart';
import 'package:testapp_aoi/utils/extension/screenExtension.dart';
import 'package:testapp_aoi/utils/method_widget/alertError_widget.dart';
import 'package:testapp_aoi/utils/method_widget/show_loading_widget.dart';
import 'package:testapp_aoi/utils/validation/validation_textform.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  bool displayPassword = false;
  @override
  Widget build(BuildContext context) {
    _controllerEmail.text = 'gabejas488@cabose.com';
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: ListView(children: [
        SizedBox(
          height: 250,
          width: context.getWidth(),
          child: Image.asset('assets/investment.png'),
        ),
        const Center(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Login your account",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        )),
        AuthFelid(
          keyForm: _emailKey,
          controller: _controllerEmail,
          keyboardType: TextInputType.emailAddress,
          hint: "Email",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Email';
            }
            if (!value.contains("@")) {
              return 'Please enter valid email';
            }
            return null;
          },
        ),
        AuthFelid(
          keyForm: _passwordKey,
          controller: _controllerPassword,
          keyboardType: TextInputType.visiblePassword,
          hint: "Password",
          prefixIcon: Icons.password,
          isPass: true,
          displayPass: displayPassword,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Password';
            }

            return null;
          },
          onTap: () {
            displayPassword = !displayPassword;
            setState(() {});
          },
        ),
        ButtonAuth(
          onPressed: () async {
            loadingWidget(context: context);
            List<bool> isValidation = [];
            isValidation.add(validation(keyForm: _emailKey));
            isValidation.add(validation(keyForm: _passwordKey));
            if (!isValidation.contains(false)) {
              Map<String, dynamic> bodyMap = {
                "email": _controllerEmail.text.trim(),
                "password": _controllerPassword.text.trim()
              };
              AuthMethodNetworking methodAPI = AuthMethodNetworking();
              final results = await methodAPI.loginMethod(body: bodyMap);

              if (results.codeState == 200) {
                Navigator.pop(context);
                context.pushAndRemoveUntil(
                    view: VerificationScreen(
                  email: _controllerEmail.text.trim(),
                  type: TypeOfAuth.login,
                ));
              } else {
                Navigator.pop(context);
                alertError(context: context, msg: results.msg);
              }
            } else {
              Navigator.pop(context);
            }
          },
        ),
        Center(
          child: Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'You don\'t have account? '),
                TextSpan(
                  text: 'Registration',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => context.pushAndRemoveUntil(
                        view: const RegistrationScreen()),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        )
      ])),
    );
  }
}
