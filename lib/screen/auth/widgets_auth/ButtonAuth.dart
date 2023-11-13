import 'package:flutter/material.dart';

class ButtonAuth extends StatelessWidget {
  const ButtonAuth({super.key, this.title = 'Login', this.onPressed});
  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(250, 45),
              backgroundColor: Colors.black,
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              foregroundColor: Colors.white),
          child: Text(title),
        ),
      ),
    );
  }
}
