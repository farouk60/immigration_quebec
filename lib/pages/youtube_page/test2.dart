import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

void main() {
  runApp(new ExampleApp2());
}

class ExampleApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'NumberPicker Example',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'NumberPicker Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentValue = 1;
  String minValue = "farouk";
  String maxValue = "ali";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        ListView.builder(
        itemBuilder: (BuildContext context, int index){
      return new Card(
        child: new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              new CheckboxListTile(
                  value: maxValue,
                  title: new Text("Current number: $_currentValue"),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (newValue) =>
                    setState(() => _currentValue = newValue)),
            new Text("Current number: $_currentValue"),
          ],
        ),
      ),
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
    );
  }
}