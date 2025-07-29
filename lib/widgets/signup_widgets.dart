import 'package:flutter/material.dart';

Widget buildSignUpTextField({
  required TextEditingController controller,
  required String hint,
  FocusNode? focusNode,
  bool isPassword = false,
  VoidCallback? onEditingComplete,
}) {
  return Container(
    width: 300,
    height: 45,
    padding: const EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: TextField(
      controller: controller,
      focusNode: focusNode,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        border: InputBorder.none,
      ),
      style: const TextStyle(color: Colors.black),
      textInputAction: TextInputAction.next,
      onEditingComplete: onEditingComplete,
    ),
  );
}
