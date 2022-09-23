import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var operator = '';
  var text = '0';

  insertNumber(value) {
    setState(() {
      if (text == '0' || text == 'Infinity') {
        text = value.toString();
      } else {
        text += value.toString();
      }
    });
  }

  setOperator(newOperator) {
    setState(() {
      if (operator != '') {
        calculate();
        text += newOperator.toString();
        operator = newOperator;
      } else {
        text += newOperator.toString();
        operator = newOperator;
      }
    });
  }

  calculate() {
    var data = text.split(operator);

    var number1 = data[0];
    var number2 = data[1];

    setState(() {
      switch(operator) {
        case '*':
          text = (double.parse(number1) * double.parse(number2)).toStringAsFixed(1);
          break;
        case '/':
          text = (double.parse(number1) / double.parse(number2)).toStringAsFixed(1);
          break;
        case '-':
          text = (double.parse(number1) - double.parse(number2)).toStringAsFixed(1);
          break;
        case '+':
          text = (double.parse(number1) + double.parse(number2)).toStringAsFixed(1);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double screenSize = 200;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Container(
        height: size.height,
        child: Column(
          children: [
            Container(
                color: Colors.black,
                height: screenSize,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(text,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 80
                      ),
                    ),
                  ],
                )
            ),
            Expanded(
                child: CalcButton(
                  textColor: Colors.orange,
                  onItemTap: () {
                    calculate();
                  },
                  text: "=",
                )
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              color: Colors.black,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: CalcButton(
                            textColor: Colors.white,
                            onItemTap: () {
                              calculate();
                            },
                            text: "=",
                          )
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CalcButton(
                            color: Colors.grey,
                            onItemTap: () {
                              insertNumber(7);
                            },
                            text: "7",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.grey,
                            onItemTap: () {
                              insertNumber(8);
                            },
                            text: "8",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.grey,
                            onItemTap: () {
                              insertNumber(9);
                            },
                            text: "9",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            textColor: Colors.white,
                            onItemTap: () {
                              setOperator('/');
                            },
                            text: "/",
                          )
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CalcButton(
                            color: Colors.grey,
                            onItemTap: () {
                              insertNumber(4);
                            },
                            text: "4",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.grey,
                            onItemTap: () {
                              insertNumber(5);
                            },
                            text: "5",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.grey,
                            onItemTap: () {
                              insertNumber(6);
                            },
                            text: "6",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            textColor: Colors.white,
                            onItemTap: () {
                              setOperator('*');
                            },
                            text: "*",
                          )
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CalcButton(
                            color: Colors.grey,
                            onItemTap: () {
                              insertNumber(1);
                            },
                            text: "1",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.grey,
                            onItemTap: () {
                              insertNumber(2);
                            },
                            text: "2",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.grey,
                            onItemTap: () {
                              insertNumber(3);
                            },
                            text: "3",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            textColor: Colors.white,
                            onItemTap: () {
                              setOperator('-');
                            },
                            text: "-",
                          )
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CalcButton(
                            color: Colors.grey,
                            onItemTap: () {
                              insertNumber(0);
                            },
                            text: "0",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.grey,
                            onItemTap: () {
                              insertNumber('.');
                            },
                            text: ".",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            textColor: Colors.white,
                            onItemTap: () {
                              setState(() {
                                text = '0';
                                operator = '';
                              });
                            },
                              text: "C",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            textColor: Colors.white,
                            onItemTap: () {
                              setOperator('+');
                            },
                            text: "+",
                          ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
                color: Colors.black,
                height: screenSize,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(text,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 80
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}

class CalcButton extends StatelessWidget {

  final String text;
  final TapCallBack onItemTap;
  final Color? color;
  final Color? textColor;

  const CalcButton({
    required this.text,
    required this.onItemTap,
    this.color,
    this.textColor,
    Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      margin: const EdgeInsets.all(5),
      child: MaterialButton(
        color: color ?? Colors.orange,
        onPressed: onItemTap,
        shape: CircleBorder(),
        child:  Text(text,
          style: TextStyle(
              color: textColor ?? Colors.black,
              fontSize: 40
          ),
        ),
      ),
    );
  }

}

typedef TapCallBack = void Function();