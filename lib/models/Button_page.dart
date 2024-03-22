import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key,
      this.loading = false,
      required this.ontap,
      required this.text,
      this.color = Colors.pinkAccent,
      this.heightsize = 55,
      this.widthsize = 200});
  final bool loading;
  final VoidCallback ontap;
  final String text;
  final Color color;
  final double heightsize;
  final double widthsize;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: heightsize,
          width: widthsize,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(width: 1.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: loading
                ? CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  )
                : Text(
                    text,
                    style: TextStyle(fontSize: 20),
                  ),
          ),
        ),
      ),
    );
  }
}
