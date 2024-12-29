import 'package:flutter/material.dart';

void removeFocus() {
  FocusManager.instance.primaryFocus?.unfocus();
}

bool isValidEmail(String email) {
  return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
      .hasMatch(email);
}

bool isValidPassword(String password) {
  return RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d\W_]{6,}$')
      .hasMatch(password);
}