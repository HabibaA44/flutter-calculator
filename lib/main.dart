import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:untitled7/coustom_eq_res.dart';
import 'coustom_buttom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String equation = '';

  String result = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff16171C),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
                right: 10,
                left: 10,
                bottom: 20,
              ),
              child: Row(
                children: [
                  Switch(value: true, onChanged: (value) {}),
                  Spacer(),
                  Icon(Icons.history, color: Colors.blueAccent, size: 50),
                ],
              ),
            ),
            CoustomEqRes(text: equation),
            CoustomEqRes(text: result),
            SizedBox(height: 16),
            Divider(thickness: 1),
            Row(
              children: [
                Buttom(
                  text: 'C',
                  ontap: () {
                    setState(() {
                      clear();
                    });
                  },
                  ioOPtype: true,
                ),
                Buttom(
                  text: '⌫',
                  ontap: () {
                    setState(() {
                      backSpace();
                    });
                  },
                  ioOPtype: true,
                ),
                Buttom(
                  text: '%',
                  ontap: () {
                    setState(() {
                      addOP('%');
                    });
                  },
                  ioOPtype: true,
                ),
                Buttom(
                  text: '/',
                  ontap: () {
                    setState(() {
                      addOP('/');
                    });
                  },
                  ioOPtype: true,
                ),
              ],
            ),
            Row(
              children: [
                Buttom(
                  text: '7',
                  ontap: () {
                    setState(() {
                      addNum('7');
                    });
                  },
                  ioOPtype: false,
                ),
                Buttom(
                  text: '8',
                  ontap: () {
                    setState(() {
                      addNum('8');
                    });
                  },
                  ioOPtype: false,
                ),
                Buttom(
                  text: '9',
                  ontap: () {
                    setState(() {
                      addNum('9');
                    });
                  },
                  ioOPtype: false,
                ),
                Buttom(
                  text: 'x',
                  ontap: () {
                    setState(() {
                      addOP('x');
                    });
                  },
                  ioOPtype: true,
                ),
              ],
            ),
            Row(
              children: [
                Buttom(
                  text: '4',
                  ontap: () {
                    setState(() {
                      addNum('4');
                    });
                  },
                  ioOPtype: false,
                ),
                Buttom(
                  text: '5',
                  ontap: () {
                    setState(() {
                      addNum('5');
                    });
                  },
                  ioOPtype: false,
                ),
                Buttom(
                  text: '6',
                  ontap: () {
                    setState(() {
                      addNum('6');
                    });
                  },
                  ioOPtype: false,
                ),
                Buttom(
                  text: '-',
                  ontap: () {
                    setState(() {
                      addOP('-');
                    });
                  },
                  ioOPtype: true,
                ),
              ],
            ),
            Row(
              children: [
                Buttom(
                  text: '1',
                  ontap: () {
                    setState(() {
                      addNum('1');
                    });
                  },
                  ioOPtype: false,
                ),
                Buttom(
                  text: '2',
                  ontap: () {
                    setState(() {
                      addNum('2');
                    });
                  },
                  ioOPtype: false,
                ),
                Buttom(
                  text: '3',
                  ontap: () {
                    setState(() {
                      addNum('3');
                    });
                  },
                  ioOPtype: false,
                ),
                Buttom(
                  text: '+',
                  ontap: () {
                    setState(() {
                      addOP('+');
                    });
                  },
                  ioOPtype: true,
                ),
              ],
            ),
            Row(
              children: [
                Buttom(
                  text: '.',
                  ontap: () {
                    setState(() {
                      addNum('.');
                    });
                  },
                  ioOPtype: false,
                ),
                Buttom(
                  text: '0',
                  ontap: () {
                    setState(() {
                      addNum('0');
                    });
                  },
                  ioOPtype: false,
                ),
                Buttom(
                  text: '+-',
                  ontap: () {
                    setState(() {
                      toggel();
                    });
                  },
                  ioOPtype: false,
                ),
                Buttom(
                  text: '=',
                  ontap: () {
                    setState(() {
                      evalute();
                    });
                  },
                  ioOPtype: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void addNum(String num) {
    if (num == '.' && equation.endsWith('.')) {
      return;
    }
    equation += num;
  }

  void backSpace() {
    if (equation.isEmpty)
      return;
    else {
      equation = equation.substring(0, equation.length - 1);
    }
  }

  void clear() {
    equation = '';
    result = '';
  }

  void addOP(String op) {
    if (equation.isEmpty) {
      if (op == '-') {
        equation += op;
      }
      return;
    }
    final String lastChar = equation[equation.length - 1];
    if ('+-/x%'.contains(lastChar)) {
      return;
    }
    equation += op;
  }

  void toggel() {
    if (equation.isEmpty) return;

    if (equation.startsWith('-')) {
      equation = equation.substring(1);
    }
  }

  void evalute() {
    if (equation.isEmpty) return;
    String exptr = equation.replaceAll('x', '*').replaceAll('%', '/100');

    GrammarParser p = GrammarParser();
    Expression expression = p.parse(exptr);
    double evl = expression.evaluate(EvaluationType.REAL, ContextModel());
    result = evl.toString();
  }
}
