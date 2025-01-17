import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customButton(String text, VoidCallback function) {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: MaterialButton(
      color: Color.fromRGBO(8, 114, 110, 1.0),
      onPressed: function,
      child: Text(
        text,
        style:
            TextStyle(color: Color.fromRGBO(191, 223, 222, 1.0), fontSize: 20),
      ),
    ),
  );
}

Widget customIcon(IconData iconData, VoidCallback function) {
  return IconButton(
    iconSize: 60,
    onPressed: () {},
    icon: Icon(
      iconData,
    ),
  );
}
