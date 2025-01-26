import 'package:flutter/material.dart';

typedef Json = Map<String, dynamic>;

class Constants {
  static const shortAnimationDuration = Duration(milliseconds: 300);
  static final textFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(100.0),
  );
}

extension Capitalize on String {
  String capitalize() {
    if (isNotEmpty) {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }
    return "";
  }
}
