import 'package:flutter/material.dart';

alertError({required BuildContext context, required String msg}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.white,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Error",
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text(
            msg,
            style: const TextStyle(color: Colors.black),
          )
        ],
      )));
}
