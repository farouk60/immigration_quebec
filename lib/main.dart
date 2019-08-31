import 'package:flutter/material.dart';
import 'package:immigration_quebec/pages/quiz_page/quiz1.dart';
import 'package:immigration_quebec/pages/quiz_page/quiz2.dart';
import 'package:immigration_quebec/pages/youtube_page/youtube_home_page.dart';

void main() => runApp(new MaterialApp(home: HomePage()));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Center(
            child: new Row(
              children: <Widget>[
                new Icon(Icons.home),
                new Text('Guide Immigration Québec'),
              ],
            ),
          ),
        ),
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/quebec_flag.jpg'),
                      fit: BoxFit.fill)),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: new MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    splashColor: Colors.green,
                    color: Colors.green[400],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ArabicPage()),
                      );
                    },
                    child: Text("Arabic",
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  ),
                ),
                Center(
                  child: new MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    splashColor: Colors.blue,
                    color: Colors.blue[400],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage2()),
                      );
                    },
                    child: Text("French",
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  ),
                ),
                Center(
                  child: new MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    splashColor: Colors.red,
                    color: Colors.red[400],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuebecQuiz()),
                      );
                    },
                    child: Text("English",
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ArabicPage extends StatelessWidget {
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
