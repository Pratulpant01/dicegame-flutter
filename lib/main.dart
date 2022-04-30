import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text("Lucky Dice")),
          backgroundColor: Colors.red,
        ),
        body: DicePage()),
  ));
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftdicenumber = 2;
  int rightdicenumber = 6;
  int totalsum = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                  onPressed: () {
                    diceroll();
                  },
                  child: Image.asset('images/dice${leftdicenumber}.png')),
            ),
            Expanded(
                child: TextButton(
              onPressed: () {
                diceroll();
              },
              child: Image.asset('images/dice${rightdicenumber}.png'),
            )),
          ],
        ),
        SizedBox(height: 40),
        Text(
          "Your Left Dice Number is $leftdicenumber",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 40),
        Text(
          "Your Right Dice Number is $rightdicenumber",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 30),
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.red[900]),
            onPressed: () {
              setState(() {
                totalsum = leftdicenumber + rightdicenumber;
              });
            },
            child: Text('Calculate Sum')),
        SizedBox(height: 30),
        Text(
          "Total sum of your lucky dice is $totalsum",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  void diceroll() {
    setState(() {
      rightdicenumber = Random().nextInt(6) + 1;
      leftdicenumber = Random().nextInt(6) + 1;
    });
  }
}
