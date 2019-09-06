import 'dart:ffi';

import 'package:flutter/material.dart';

bool monVal = false;
bool tuVal = false;
bool wedVal = false;
double _meter = 0;
double _result = 0;
String _finalResultPrint = "";
String _doneResult = "";

void main() => runApp(Calcul2());

class Calcul2 extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Calcul2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Checkboxes"),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // [Monday] checkbox
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Mon"),
                Checkbox(
                  value: monVal,
                  onChanged: (bool value) {
                    setState(() {
                      monVal = value;
                      print(value);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
