import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  DemoState createState() => new DemoState();
}

class DemoState extends State<Demo> {
  Map<String, bool> values = {
    'foo': false,
  };
  String _text = "initial";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('CheckboxListTile demo')),
      body: new ListView(
        children: values.keys.map((String key) {
          return new CheckboxListTile(
            title: new Text(key),
            value: values[key],
            onChanged: (bool value) {
              setState(() {
                values[key] = value;
              });
              new Text("Text Input: $_text");
            },

          );

        }).toList(),
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(home: new Demo(), debugShowCheckedModeBanner: false));

}

