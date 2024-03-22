import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Apptext extends StatelessWidget {
  Apptext(
      {super.key,
      required this.text,
      this.color,
      this.size = 30,
      this.fontweight = FontWeight.bold});
  String text;
  final double size;
  var fontweight;
  var color;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(fontSize: size, color: color, fontWeight: fontweight));
  }
}
