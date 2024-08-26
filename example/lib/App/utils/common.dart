import 'package:flutter/material.dart';

void removeFocus() {
  FocusManager.instance.primaryFocus?.unfocus();
}