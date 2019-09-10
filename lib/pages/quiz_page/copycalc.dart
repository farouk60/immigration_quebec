import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';

class Calcul extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CalculState();
  }
}

class CalculState extends State<Calcul> {
  int _age1 = 22, _age2 = 32, _totalAge = 0;
  bool _checkedAge1 = false, _checkedAge2 = false;
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            CheckboxListTile(
              title: Text("Age ${_age1}"),
              value: _checkedAge1,
              onChanged: (age) {
                setState(() {
                  _checkedAge1 = age;
                  if (_checkedAge1)
                    _totalAge += _age1;
                  else
                    _totalAge -= _age1;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Age ${_age2}"),
              value: _checkedAge2,
              onChanged: (age) {
                setState(() {
                  _checkedAge2 = age;
                  if (_checkedAge2)
                    _totalAge += _age2;
                  else
                    _totalAge -= _age2;
                });
              },
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Text("Total age = ${dropdownValue}"),
            Text("Total age = ${_totalAge}")
          ],
        ),
      ),
    );
  }
}
