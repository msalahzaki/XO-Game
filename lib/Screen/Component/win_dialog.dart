import 'package:flutter/material.dart';

class WinDialog extends StatelessWidget {
  final String title;
  final String content;

   WinDialog( {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(title :Text(title),content: Text(content),icon: Icon(Icons.wb_incandescent),
    actions: [
      ElevatedButton(onPressed: (){}, child: Text('yes')),
      ElevatedButton(onPressed: (){}, child: Text('No'))
    ],);
  }
}
