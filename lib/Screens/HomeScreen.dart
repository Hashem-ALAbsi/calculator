import 'dart:math';

import 'package:calculator/Widgets/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  var userQuestion = '';
  var userAnswer = '';
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQuestion,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return MyButton(
                      buttentapped: () {
                        setState(() {
                          userQuestion = '';
                          userAnswer = '';
                        });
                      },
                      textbutton: buttons[index],
                      color: Colors.green,
                      textcolor: Colors.white,
                    );
                  } else if (index == 1) {
                    return MyButton(
                      buttentapped: () {
                        setState(() {
                          if (userQuestion == '') {
                            userQuestion = '';
                          } else {
                            userQuestion = userQuestion.substring(
                                0, userQuestion.length - 1);
                          }
                        });
                      },
                      textbutton: buttons[index],
                      color: Colors.red,
                      textcolor: Colors.white,
                    );
                  } else if (index == 2) {
                    return MyButton(
                      buttentapped: () {
                        setState(() {
                          if (userQuestion == '') {
                            userQuestion = '';
                          } else {
                            numerOne();
                            // userQuestion = userQuestion.substring(
                            //     0, userQuestion.length - 1);
                          }
                        });
                      },
                      textbutton: buttons[index],
                      color: Colors.deepPurple,
                      textcolor: Colors.white,
                    );
                  } else if (index == buttons.length - 1) {
                    return MyButton(
                      buttentapped: () {
                        setState(() {
                          if (userQuestion == '') {
                            userQuestion == '';
                          } else {
                            equalpressed();
                          }
                        });
                      },
                      textbutton: buttons[index],
                      color: Colors.deepPurple,
                      textcolor: Colors.white,
                    );
                  } else if (index == buttons.length - 2) {
                    return MyButton(
                      buttentapped: () {
                        setState(() {
                          if (userQuestion == '') {
                            userQuestion = '';
                          } else {
                            numbersqrt();
                            // userQuestion = userQuestion.substring(
                            //     0, userQuestion.length - 1);
                          }
                        });
                      },
                      textbutton: buttons[index],
                      color: Colors.deepPurple,
                      textcolor: Colors.white,
                    );
                  } else {
                    return MyButton(
                      buttentapped: () {
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      },
                      textbutton: buttons[index],
                      color: isOperator(buttons[index])
                          ? Colors.deepPurple
                          : Colors.deepPurple[50],
                      textcolor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.deepPurple,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == '-' || x == '+' || x == '=' || x == 'x') {
      return true;
    }
    return false;
  }

  void equalpressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.ceil().toString();
  }

  void numerOne() {
    if (numcontaion() == true) {
      equalpressed();
      double num = double.parse(userAnswer);
      String num2;
      num2 = (num / 100).toString();
      userAnswer = num2;
    } else {
      int num = int.parse(userQuestion);
      String num2;
      num2 = (num / 100).toString();
      userAnswer = num2;
    }
  }

  //////////////////////////////////////////
  void numbersqrt() {
    if (numcontaion() == true) {
      equalpressed();
      double num = double.parse(userAnswer);
      String num2;
      num2 = sqrt(num).toString();
      userAnswer = num2;
    } else {
      int num = int.parse(userQuestion);
      String num2;
      num2 = sqrt(num).toString();
      userAnswer = num2;
    }
  }

  ///////////////////////////////////////////
  bool numcontaion() {
    //x == '%' || x == '/' || x == '-' || x == '+' || x == '=' || x == 'x'
    if (userQuestion.contains("x") ||
        userQuestion.contains("/") ||
        userQuestion.contains("-") ||
        userQuestion.contains("+")) {
      return true;
    }
    return false;
  }
}
