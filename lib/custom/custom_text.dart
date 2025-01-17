import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customText(String text) {
  return RichText(
    textAlign: TextAlign.start,
    text: TextSpan(
      text: 'Welcome\n',
      style: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(80, 173, 163, 1.0),
          height: 1.5,
          fontWeight: FontWeight.w500),
      children: [
        TextSpan(
          text: text,
          style: TextStyle(
              fontSize: 30,
              color: Color.fromRGBO(191, 223, 222, 1.0),
              fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

Widget customTextButton(String text, String text2, VoidCallback function) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text,
        style: TextStyle(color: Colors.grey),
      ),
      TextButton(
        onPressed: function,
        child: Text(
          text2,
          style: TextStyle(
            color: Color.fromRGBO(8, 114, 110, 1.0),
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ],
  );
}
