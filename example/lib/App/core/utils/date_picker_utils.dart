import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DatePickerUtils on BuildContext {
  Future<DateTime?> selectDate({DateTime? firstDate, DateTime? lastDate, DateTime? initialDate}) async {
    return await showDatePicker(
      context: this,
      firstDate: firstDate ?? DateTime.now(),
      lastDate: DateTime.now(),
      initialDate: initialDate ?? DateTime(2000, 01, 01),
    );
  }
}

extension DateUtil on String {
  String? get toTime {
    DateTime? date = DateTime.tryParse(this);
    if (date == null) return null;
    return DateFormat('hh:mm a').format(date);
  }

  String? get toDate {
    DateTime? date = DateTime.tryParse(this);
    if (date == null) return null;
    return DateFormat('dd/MM/yyyy').format(date);
  }
}