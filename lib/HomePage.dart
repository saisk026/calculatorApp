import 'package:flutter/material.dart';
import 'MyButton.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';
  final mytextstyle = TextStyle(fontSize: 30.0, color: Colors.white);
  final List<String> buttons = [
    'DEL',
    'C',
    '%',
    '/',
    '9',
    '8',
    '7',
    'X',
    '6',
    '5',
    '4',
    '+',
    '3',
    '2',
    '1',
    '-',
    '0',
    '.',
    '00',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black38,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              // Color(0xFF455A64),
              Color(0xFF37474F),
              Color(0xFF263238),
            ],
          ),
        ),
        child: Column(
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
                      padding: EdgeInsets.all(20.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userQuestion,
                        style: GoogleFonts.montserrat(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: GoogleFonts.montserrat(
                          fontSize: 30,
                          color: Colors.white,
                        ),
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
                          return Mybutton(
                            buttontapped: () {
                              setState(() {
                                userQuestion = userQuestion.substring(
                                    0, userQuestion.length - 1);
                                userAnswer = userQuestion.substring(
                                    0, userQuestion.length);
                              });
                            },
                            buttontext: buttons[index],
                            color: Colors.deepOrangeAccent,
                            textcolor: Colors.white,
                          );
                        } else if (index == 1) {
                          return Mybutton(
                            buttontapped: () {
                              setState(() {
                                userQuestion = '';
                                userAnswer = '';
                              });
                            },
                            buttontext: buttons[index],
                            color: Colors.redAccent,
                            textcolor: Colors.white,
                          );
                        } else if (index == buttons.length - 1) {
                          return Mybutton(
                            buttontapped: () {
                              setState(() {
                                equalPressed();
                              });
                            },
                            buttontext: buttons[index],
                            color: Colors.blueGrey,
                            textcolor: Colors.white,
                          );
                        } else {
                          return Mybutton(
                            buttontapped: () {
                              setState(() {
                                userQuestion += buttons[index];
                              });
                            },
                            buttontext: buttons[index],
                            color: isoperator(buttons[index])
                                ? Colors.blueGrey
                                : Colors.deepPurple[50],
                            textcolor: isoperator(buttons[index])
                                ? Colors.white
                                : Colors.deepPurple,
                          );
                        }
                      })),
            ),
          ],
        ),
      ),
    );
  }

  bool isoperator(String x) {
    if (x == '%' || x == '/' || x == 'X' || x == '+' || x == '-' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    Parser p = Parser();
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('X', '*');

    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}
