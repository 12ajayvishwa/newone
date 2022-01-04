import 'package:flutter/material.dart';

InputDecoration inputDecoration(
  String labelText,
  IconData prefixIcon,
) {
  return InputDecoration(
      labelText: labelText,
      prefixIcon: Icon(prefixIcon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ));
}
