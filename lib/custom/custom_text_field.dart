import 'package:flutter/material.dart';

Widget customTextField(
    String label,
    String hintText,
    TextInputType textInputType,
    bool obscure,
    TextEditingController controller) {
  return TextField(

    showCursor: false,
    keyboardType: textInputType,
    style: TextStyle(color: Color.fromRGBO(118, 118, 118, 1.0), fontSize: 20),
    obscureText: obscure,
    controller: controller,
    decoration: InputDecoration(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
      ),
      label: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 22,
          color: Color.fromRGBO(77, 77, 100, 1.0),
        ),
      ),
      hintText: hintText,
      hintStyle:
          TextStyle(color: Color.fromRGBO(157, 154, 154, 1.0), fontSize: 15),
    ),
  );
}
