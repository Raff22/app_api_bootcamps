import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:testapp_aoi/screen/auth/login_screen.dart';
import 'package:testapp_aoi/screen/auth/verification_screen%20copy.dart';
import 'package:testapp_aoi/screen/auth/widgets_auth/auth_felid.dart';
import 'package:testapp_aoi/screen/auth/widgets_auth/ButtonAuth.dart';
import 'package:testapp_aoi/utils/extension/navExtension.dart';
import 'package:testapp_aoi/utils/extension/screenExtension.dart';
import 'package:testapp_aoi/utils/validation/validation_textform.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _nameKey = GlobalKey<FormState>();
  final _phoneKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  bool displayPassword = false;

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  File? image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          // resizeToAvoidBottomInset: false,
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
            "Registration your account",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        )),
        AuthFelid(
          keyForm: _nameKey,
          controller: _controllerName,
          keyboardType: TextInputType.name,
          hint: "Name",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Name';
            }
            return null;
          },
        ),
        AuthFelid(
          keyForm: _phoneKey,
          controller: _controllerPhone,
          keyboardType: TextInputType.phone,
          hint: "Phone",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Phone number';
            }
            return null;
          },
        ),
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
            if (value.length < 6) {
              return 'The minimum of password is 6 digits';
            }

            return null;
          },
          onTap: () {
            displayPassword = !displayPassword;
            setState(() {});
          },
        ),
        ButtonAuth(
          onPressed: () {
            List<bool> isValidation = [];
            isValidation.add(validation(keyForm: _nameKey));
            isValidation.add(validation(keyForm: _phoneKey));
            isValidation.add(validation(keyForm: _emailKey));
            isValidation.add(validation(keyForm: _passwordKey));
            if (!isValidation.contains(false)) {
              context.pushAndRemoveUntil(
                  view: const VerificationScreen(
                email: '',
                type: TypeOfAuth.registration,
              ));
            }
          },
        ),
        Center(
          child: Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'Do you have account? '),
                TextSpan(
                  text: 'Log in',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () =>
                        context.pushAndRemoveUntil(view: const LoginScreen()),
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
