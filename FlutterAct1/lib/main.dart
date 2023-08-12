import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff840e05),
        appBar: AppBar(
          backgroundColor: Color(0xfff9f9f9),
          title: const Center(
            child: Text(
              'Dados :D',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void randoNumberGenerator() {
    rightDiceNumber = Random().nextInt(6) + 1;
    leftDiceNumber = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  randoNumberGenerator();
                });
              },
              child: Image.asset("image/dice$leftDiceNumber.png"),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  randoNumberGenerator();
                });
              },
              child: Image.asset("image/dice$rightDiceNumber.png"),
            ),
          ),
        ],
      ),
    );
  }
}
