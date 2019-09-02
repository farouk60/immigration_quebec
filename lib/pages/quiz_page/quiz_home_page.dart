// test quiz
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:immigration_quebec/pages/quiz_page/quiz1.dart';
import 'package:immigration_quebec/pages/quiz_page/quiz2.dart';

class QuebecQuiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new QuebecEconomy();
  }
}

class QuebecEconomy extends State<QuebecQuiz> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Multiple Choix Quiz"),
        backgroundColor: Colors.blue,
      ),
      body: new Container(
        margin: const EdgeInsets.all(50.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                height: 50.0,
                color: Colors.green,
                elevation: 8,
                onPressed: startQubecEconomyQuiz,
                child: new Text(
                  "Économie du Québec",
                  style: new TextStyle(fontSize: 18.0, color: Colors.white),
                )),
            new MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                height: 50.0,
                color: Colors.blue,
                elevation: 8,
                onPressed: startQubecPoliticQuiz,
                child: new Text(
                  "Politique du Québec",
                  style: new TextStyle(fontSize: 18.0, color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }

  void startQubecEconomyQuiz() {
    setState(() {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => new QubecEconomy()));
    });
  }
  void startQubecPoliticQuiz() {
    setState(() {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => new QubecPolitic()));
    });
  }

}
