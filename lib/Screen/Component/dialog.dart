import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogCus extends StatelessWidget {
  final String title;
  final String content;


  DialogCus( {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
       return AlertDialog(title :Text(title,style: TextStyle(fontWeight: FontWeight.bold),),content: Text(content),
    actions: [
      ElevatedButton(onPressed: (){

        Navigator.pop(context);

      }, child: Text('yes')),
      ElevatedButton(onPressed: (){

        SystemNavigator.pop();

      }, child: Text('No'))
    ],);
  }
}
