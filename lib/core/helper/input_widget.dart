import 'package:flutter/material.dart';

Widget inputField(String hint, {bool pass = false}) {
  return TextField(
    obscureText: pass,
    decoration: InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey.shade200,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    ),
  );
}
