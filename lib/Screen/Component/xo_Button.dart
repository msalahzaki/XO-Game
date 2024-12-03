import 'package:flutter/material.dart';

class Xobutton extends StatelessWidget {
  final String text;

  final Function buttonClicked;
  final int index;
  Color btColor;
  Xobutton(
      {super.key,
      required this.text,
      required this.buttonClicked,
        required this.index,
      this.btColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Expanded(

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: () {
              buttonClicked(index);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: Colors.teal[200],
              foregroundColor: text== 'X' ? Colors.green : Colors.red
            ),
            child: Text(
              text,
              style: TextStyle(fontSize: 50, color: text== 'X' ? Colors.green : Colors.red),
            )),
      ),
    );
  }
}
