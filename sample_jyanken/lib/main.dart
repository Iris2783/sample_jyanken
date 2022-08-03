import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({Key? key}) : super(key: key);

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  //変数の記述
  String computerHand = '';
  String myHand = '';
  String result = '';

  //関数の記述　voidは返り値の型、Stringは文字列の型、selectHandは関数名(任意の関数名を指定)、()に引数を記述
  void selectHand(String selectedHand) {
    myHand = selectedHand;
    generateComputerHand();
    judge();
    setState(() {}); //画面を更新するために記述する, flutterでは画面を勝手に更新してくれない
  }

//じゃんけんの出し手をランダムに設定する記述　generateComputerHandは関数名
  void generateComputerHand() {
    final randomNumber = Random().nextInt(3);
    computerHand = randomNumberToHand(randomNumber);
  } //Randomを使ってランダムに値を出力してくれるように設定できる

//0-2の値をグー、チョキ、パーに変換する記述
  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return '✊';
      case 1:
        return '✌️';
      case 2:
        return '✋';
      default:
        return '✊';
    }
  }

//勝ち負けの判定のif文記述
  void judge() {
    if (computerHand == myHand) {
      result = '引き分け';
    } else if (myHand == '✊' && computerHand == '✌️' ||
        myHand == '✌️' && computerHand == '✋' ||
        myHand == '✋' && computerHand == '✊') {
      result = '勝ち';
    } else {
      result = '負け';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('じゃんけん'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            result,
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            computerHand,
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            myHand,
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  selectHand('✊');
                },
                child: Text('✊'),
              ),
              ElevatedButton(
                onPressed: () {
                  selectHand('✌️');
                },
                child: Text('✌️'),
              ),
              ElevatedButton(
                onPressed: () {
                  selectHand('✋');
                },
                child: Text('✋'),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
