
import 'package:flutter/material.dart';

class LabelAbout extends StatelessWidget {
  const LabelAbout({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Text(
                "$title :",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(value)
            ],
          )),
    );
  }
}
