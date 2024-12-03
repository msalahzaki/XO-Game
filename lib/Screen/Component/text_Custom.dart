import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final Color text1Color;
  final Color text2Color;
  final Color text3Color;

  final double fontsize;

  const TextCustom(
      {super.key,
      this.text1 = "",
      this.text2 = "",
      this.text3 = "",
      this.text1Color = Colors.black,
       this.text2Color= Colors.black,
       this.text3Color= Colors.black,
       this.fontsize=22});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text1,
        style: TextStyle(color: text1Color, fontSize: fontsize),
        children: <TextSpan>[
          TextSpan(
            text: text2,
            style: TextStyle(
                color: text2Color, fontSize: fontsize, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: text3,
            style: TextStyle(color: text3Color, fontSize: fontsize),
          ),
        ],
      ),
    );
  }
}
