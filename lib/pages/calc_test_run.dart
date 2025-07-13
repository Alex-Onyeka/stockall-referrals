import 'package:flutter/material.dart';
import 'package:stockallref/theme/theme.dart';

class CalcTestRun extends StatefulWidget {
  const CalcTestRun({super.key});

  @override
  State<CalcTestRun> createState() => _CalcTestRunState();
}

class _CalcTestRunState extends State<CalcTestRun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text(
          style: TextStyle(color: secondary(context)),
          'My Calculator',
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(42, 0, 0, 0),
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 15,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.end,
                        children: [
                          AltResultText(text: '222'),
                          AltResultText(text: ' + '),
                          AltResultText(text: '10'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.end,
                        children: [
                          Text(
                            style: TextStyle(
                              color: secondary(context),
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                            '232',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.grey.shade300,
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: const Color.fromARGB(
                        20,
                        0,
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Button(
                                  action: () {},
                                  color: Colors.red,
                                  text: 'AC',
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Button(
                                  action: () {},
                                  color: Colors.grey,
                                  text: '/',
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Button(
                                  action: () {},
                                  color:
                                      Colors.grey.shade700,
                                  text: '7',
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Button(
                                  action: () {},
                                  color:
                                      Colors.grey.shade700,
                                  text: '8',
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Button(
                                  action: () {},
                                  color:
                                      Colors.grey.shade700,
                                  text: '9',
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Button(
                                  action: () {},
                                  color:
                                      Colors.grey.shade700,
                                  text: '4',
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Button(
                                  action: () {},
                                  color:
                                      Colors.grey.shade700,
                                  text: '5',
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Button(
                                  action: () {},
                                  color:
                                      Colors.grey.shade700,
                                  text: '6',
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Button(
                                  action: () {},
                                  color:
                                      Colors.grey.shade700,
                                  text: '1',
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Button(
                                  action: () {},
                                  color:
                                      Colors.grey.shade700,
                                  text: '2',
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Button(
                                  action: () {},
                                  color:
                                      Colors.grey.shade700,
                                  text: '3',
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Button(
                                  action: () {},
                                  color:
                                      Colors.grey.shade700,
                                  text: '0',
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Button(
                                  action: () {},
                                  color:
                                      Colors.grey.shade700,
                                  text: '.',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 1, child: Column()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final Color color;
  final Function() action;
  const Button({
    super.key,
    required this.text,
    required this.action,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
          border: Border.all(
            color: Colors.grey.shade900,
            width: 0.5,
          ),
        ),
        child: InkWell(
          onTap: action,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                style: TextStyle(
                  color: const Color.fromRGBO(
                    255,
                    255,
                    255,
                    1,
                  ),
                  fontSize: 25,
                ),
                text,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AltResultText extends StatelessWidget {
  final String text;

  const AltResultText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      style: TextStyle(
        color: tertiary(context),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      text,
    );
  }
}
