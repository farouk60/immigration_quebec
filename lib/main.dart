import 'package:flutter/material.dart';
import 'package:immigration_quebec/pages/general_information_page/informations_page.dart';
import 'package:immigration_quebec/pages/quiz_page/copycalc.dart';
import 'package:immigration_quebec/pages/quiz_page/quiz_home_page.dart';
import 'package:immigration_quebec/pages/quiz_page/testfarouk.dart';
import 'package:immigration_quebec/pages/test.dart';
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
                        MaterialPageRoute(builder: (context) => InfoPage()),
                      );
                    },
                    child: Text("Documentations",
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
                    child: Text("Quiz sur le Quebec",
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  ),
                ),
                Center(
                  child: new MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    splashColor: Colors.red,
                    color: Colors.pink[400],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Calcul()),
                      );
                    },
                    child: Text("Calcul",
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  ),
                ),
                Center(
                  child: new MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    splashColor: Colors.red,
                    color: Colors.blue[400],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => YoutubeVideos()),
                      );
                    },
                    child: Text("Videos",
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  ),
                ),
                Center(
                  child: new MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    splashColor: Colors.red,
                    color: Colors.blue[400],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Demo()),
                      );
                    },
                    child: Text("Calculator",
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


