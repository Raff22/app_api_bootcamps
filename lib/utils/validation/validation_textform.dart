import 'package:flutter/material.dart';

validation({required GlobalKey<FormState> keyForm}) {
  if (!keyForm.currentState!.validate()) {
    return false;
  }
  return true;
}
