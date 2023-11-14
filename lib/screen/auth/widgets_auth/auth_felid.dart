import 'package:flutter/material.dart';

class AuthFelid extends StatelessWidget {
  const AuthFelid({
    super.key,
    this.hint = "Email",
    this.prefixIcon = Icons.email,
    this.isPass = false,
    this.displayPass = false,
    this.onTap,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.keyForm,
    this.validator,
  });
  final String hint;
  final IconData prefixIcon;
  final bool isPass;
  final bool displayPass;
  final Function()? onTap;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final GlobalKey? keyForm;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: keyForm,
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          obscureText: !isPass ? false : !displayPass,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.green),
            label: Text(
              hint,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
            prefixIcon: Icon(
              prefixIcon,
              color: Colors.black,
            ),
            suffixIcon: !isPass
                ? null
                : InkWell(
                    onTap: onTap,
                    child: Icon(!displayPass
                        ? Icons.visibility_off_sharp
                        : Icons.remove_red_eye),
                  ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
          ),
        ),
      ),
    );
  }
}
