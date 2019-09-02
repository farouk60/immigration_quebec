import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/quebec_flag_no_yellow.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        new Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Arabic"),
          ),
          body: new DefaultTextStyle(
            style: new TextStyle(
                height: 2.0,
                inherit: true,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.green,
                decorationStyle: TextDecorationStyle.wavy,
                fontFamily: 'Raleway',
                color: Colors.deepOrange),
            child: new Center(
              child: new Column(
                children: <Widget>[
                  Text('This is a Text field'),
                  RichText(
                      text: TextSpan(
                        text: 'And this is a RichText field',
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}