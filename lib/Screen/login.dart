import 'package:flutter/material.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    String player1Name = 'Player1';
    String player2Name = "Player2";
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (text) {
                player1Name = text;
              },
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0), // Border color when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.green, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  label: Text(
                    "Player1 Name",
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (text) {
                player2Name = text;
              },
              decoration:const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0), // Border color when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  label: Text("Player2 Name")),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.teal)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Home(player1Name, player2Name)));
              },
              child: const Text("Lets Play",
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
