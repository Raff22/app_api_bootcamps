
import 'package:flutter/material.dart';

class EditTextFelid extends StatelessWidget {
  const EditTextFelid({
    super.key,
    this.maxLines = 1,
    required this.label,
    this.hint = "",
    this.keyboardType = TextInputType.text,
    this.isFelid = true,
    this.onTap,
    this.controller,
  });
  final int maxLines;
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final bool isFelid;
  final Function()? onTap;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !isFelid ? onTap : null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          minLines: maxLines,
          maxLines: maxLines,
          enabled: isFelid,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              label: Text(label),
              labelStyle: const TextStyle(color: Colors.black),
              hintText: hint == "" ? label : hint,
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2))),
        ),
      ),
    );
  }
}
