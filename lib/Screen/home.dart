import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:xo_game/Screen/Component/text_Custom.dart';
import 'package:xo_game/Screen/Component/dialog.dart';
import 'package:xo_game/Screen/Component/xo_Button.dart';

class Home extends StatefulWidget {
  final String player1name;

  final String player2name;

  Home(this.player1name, this.player2name);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int index = 0;
  int counter = 0;
  int end = 9;
  int player1Score = 0;
  int player2Score = 0;
  List<String> buttonValue = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: TextCustom(
          text1: "X",
          text1Color: Colors.green,
          text2: " O",
          text2Color: Colors.red,
          text3: " Game",
          fontsize: 40,
        ),
        //const Text("XO Game",style: TextStyle(fontSize: 40),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextCustom(
                      text1: "${widget.player1name} ( ",
                      text2: "X",
                      text2Color: Colors.green,
                      text3: " )"),
                  Text("$player1Score", style: const TextStyle(fontSize: 18))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextCustom(
                      text1: "${widget.player2name} ( ",
                      text2: "O",
                      text2Color: Colors.red,
                      text3: " )"),
                  Text("$player2Score", style: const TextStyle(fontSize: 18))
                ],
              )
            ],
          )),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Xobutton(
                  text: buttonValue[0], index: 0, buttonClicked: buttonClicked),
              Xobutton(
                  text: buttonValue[1], index: 1, buttonClicked: buttonClicked),
              Xobutton(
                  text: buttonValue[2], index: 2, buttonClicked: buttonClicked),
            ],
          )),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Xobutton(
                text: buttonValue[3],
                index: 3,
                buttonClicked: buttonClicked,
              ),
              Xobutton(
                  text: buttonValue[4], index: 4, buttonClicked: buttonClicked),
              Xobutton(
                  text: buttonValue[5], index: 5, buttonClicked: buttonClicked),
            ],
          )),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Xobutton(
                  text: buttonValue[6], index: 6, buttonClicked: buttonClicked),
              Xobutton(
                  text: buttonValue[7], index: 7, buttonClicked: buttonClicked),
              Xobutton(
                  text: buttonValue[8], index: 8, buttonClicked: buttonClicked),
            ],
          )),
        ],
      ),
    );
  }

  buttonClicked(int index) {
    if (buttonValue[index].isEmpty) {
      if (counter % 2 == 0) {
        buttonValue[index] = 'X';
      } else {
        buttonValue[index] = 'O';
      }
      counter++;

      if (checkWinner("X")) {
        player1Score += 1;

        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => Stack(
                  children: [
                    Lottie.asset(
                      'assets/animation/winAnimate1.json',
                    ),
                    DialogCus(
                      title: "Congratulation ${widget.player1name} win",
                      content: "play another game"
                    ),
                  ],
                )
        ).then((_){
          changeturn();
        });
        return ;

      }
      if (checkWinner("O"))  {
        player2Score += 1;

        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => Stack(
                  children: [
                    Lottie.asset(
                      'assets/animation/winAnimate1.json',
                    ),
                    DialogCus(
                      title: "Congratulation ${widget.player2name} win",
                      content: "play another game"
                    ),
                  ],
                )
        ).then((_){
          changeturn();
        });
        return ;
      }
      if (counter == end) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => DialogCus(
                  title: "Game is Draw",
                  content: "play another game",
                )).then((_){
          changeturn();
        });
      }

      setState(() {});
    }
    return ;
  }

  bool checkWinner(String player) {
    for (int i = 0; i < 9; i += 3) {
      if (buttonValue[i] == player &&
          buttonValue[i + 1] == player &&
          buttonValue[i + 2] == player) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (buttonValue[i] == player &&
          buttonValue[i + 3] == player &&
          buttonValue[i + 6] == player) {
        return true;
      }
    }
    if (buttonValue[0] == player &&
        buttonValue[4] == player &&
        buttonValue[8] == player) {
      return true;
    }
    if (buttonValue[2] == player &&
        buttonValue[4] == player &&
        buttonValue[6] == player) {
      return true;
    }

    return false;
  }

  void gameinitX() {
    counter = 0;
    end = 9;
    buttonValue = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    setState(() {});
  }

  void gameinitO() {
    counter = 1;
    end = 10;
    buttonValue = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    setState(() {});
  }

  void changeturn() {

    showDialog(context: context, builder: (context) => AlertDialog(title :Text("Choose How Start First",
      style: TextStyle(fontWeight: FontWeight.bold),),
      actions: [
        ElevatedButton(onPressed: (){
        Navigator.pop(context);
          gameinitX();

        }, child: Text(widget.player1name,style: TextStyle(color: Colors.green),)),
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
          gameinitO();
        }, child: Text(widget.player2name,style: TextStyle(color: Colors.red),))
      ],));


  }
}
