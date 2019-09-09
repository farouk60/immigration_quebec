import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';

class Calcul extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CalculState();
  }
}

class CalculState extends State<Calcul> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  double _meter = 0;
  double _result = 0;
  String _finalResultPrint = "";
  String _doneResult = "";
  bool _isChecked = true;
  void _clear() {
    setState(() {
      _ageController.clear();
      _weightController.clear();
      _heightController.clear();
    });
  }

  void _bmiValue() {
    setState(() {
      double age = double.parse(_ageController.text);
      double weight = double.parse(_weightController.text);
      double height = double.parse(_heightController.text);
      _meter = height + weight + age;

      if ((_ageController.text.isNotEmpty || age > 0) &&
          ((_heightController.text.isNotEmpty || height > 0) &&
              (_weightController.text.isNotEmpty || weight > 0))) {
        _result = _meter;
      } else {
        print("Error");
      }

      if ((double.parse(_result.toStringAsFixed(1)) < 18.5)) {
        _finalResultPrint = "UnderWeight";
        print(_finalResultPrint);
      } else if (double.parse(_result.toStringAsFixed(1)) > 18.5 &&
          (double.parse(_result.toStringAsFixed(1)) <= 25.0)) {
        _finalResultPrint = "Normal";
        print(_finalResultPrint);
      } else if ((double.parse(_result.toStringAsFixed(1)) > 25.0) &&
          (double.parse(_result.toStringAsFixed(1))) < 30.0) {
        _finalResultPrint = "OverWeight";
        print(_finalResultPrint);
      } else if ((double.parse(_result.toStringAsFixed(1))) >= 30.0) {
        _finalResultPrint = "Obesity";
        print(_finalResultPrint);
      }
    });

    _doneResult = "Your BMI is ${_result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //AppBar
      appBar: new AppBar(
        title: new Text("BmiCalc"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),

      //Body
      body: Center(
        child: CheckboxListTile(
          title: Text("title text"),
          value: true,
          onChanged: (newValue) {},
          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
        )
      ),
    );
  }
}
