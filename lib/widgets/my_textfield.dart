import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {

  final String label;
  final TextEditingController controller;
  final bool isObsecure;
  final Color color;
  final FocusNode focusNode;

  const MyTextfield({super.key, required this.label, required this.isObsecure, required this.controller, required this.color, required this.focusNode});

  @override
  Widget build(BuildContext context) {
  return Container(
      color: color,
      child: TextField(
      focusNode: focusNode,
      controller: controller,
      cursorColor: Color(0xFFFE6407),
    cursorHeight: 20,
    style: TextStyle(color: Colors.white,),
    decoration: InputDecoration(
    labelStyle: TextStyle(
    color: Color(0xFFD4D5D7),
    ),
    labelText: label,
    filled: true,
    contentPadding: EdgeInsets.only(top: 5, left: 15, bottom: 5),
    fillColor: Colors.transparent,
    alignLabelWithHint: true,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF545456),width: 2),
    ),
    focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFFE6407),width: 2),
    ),
    ),
    )
  );
  }


}
