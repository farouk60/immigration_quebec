import 'package:flutter/material.dart';

class Calcul extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CalculState();
  }
}

class CalculState extends State<Calcul> {
  static int _lev1 = 02,
      _lev2 = 06,
      _lev3 = 04,
      _lev4 = 06,
      _lev5 = 08,
      _lev6 = 04,
      _lev7 = 06,
      _lev8 = 10,
      _lev9 = 12,
      _lev10 = 14,
      _totalLev = 0;
  static bool _checkedLev1 = false,
      _checkedLev2 = false,
      _checkedLev3 = false,
      _checkedLev4 = false,
      _checkedLev5 = false,
      _checkedLev6 = false,
      _checkedLev7 = false,
      _checkedLev8 = false,
      _checkedLev9 = false,
      _checkedLev10 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          "FORMATION (Niveau de Scolarité)",
          style: new TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),

        child: new SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CheckboxListTile(
                title: Text("Secondaire général (${_lev1} points)"),
                value: _checkedLev1,
                onChanged: (age) {
                  setState(() {
                    _checkedLev1 = age;
                    if (_checkedLev1)
                      _totalLev += _lev1;
                    else
                      _totalLev -= _lev1;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("Secondaire professionnel (${_lev2} points)"),
                value: _checkedLev2,
                onChanged: (age) {
                  setState(() {
                    _checkedLev2 = age;
                    if (_checkedLev2)
                      _totalLev += _lev2;
                    else
                      _totalLev -= _lev2;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("Postsecondaire général 2 ans (${_lev3} points)"),
                value: _checkedLev3,
                onChanged: (age) {
                  setState(() {
                    _checkedLev3 = age;
                    if (_checkedLev3)
                      _totalLev += _lev3;
                    else
                      _totalLev -= _lev3;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                    "Postsecondaire tech 1 ou 2 ans (${_lev4} points)"),
                value: _checkedLev4,
                onChanged: (age) {
                  setState(() {
                    _checkedLev4 = age;
                    if (_checkedLev4)
                      _totalLev += _lev4;
                    else
                      _totalLev -= _lev4;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("Postsecondaire tech 3 ans (${_lev5} points)"),
                value: _checkedLev5,
                onChanged: (age) {
                  setState(() {
                    _checkedLev5 = age;
                    if (_checkedLev5)
                      _totalLev += _lev5;
                    else
                      _totalLev -= _lev5;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("Universitaire 1er cycle 1 an (${_lev6} points)"),
                value: _checkedLev6,
                onChanged: (age) {
                  setState(() {
                    _checkedLev6 = age;
                    if (_checkedLev6)
                      _totalLev += _lev6;
                    else
                      _totalLev -= _lev6;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("Universitaire 1er cycle 2 ans (${_lev7} points)"),
                value: _checkedLev7,
                onChanged: (age) {
                  setState(() {
                    _checkedLev7 = age;
                    if (_checkedLev7)
                      _totalLev += _lev7;
                    else
                      _totalLev -= _lev7;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                    "Universitaire 1er cycle 3 ans ou + (${_lev8} points)"),
                value: _checkedLev8,
                onChanged: (age) {
                  setState(() {
                    _checkedLev8 = age;
                    if (_checkedLev8)
                      _totalLev += _lev8;
                    else
                      _totalLev -= _lev8;
                  });
                },
              ),
              CheckboxListTile(
                title:
                    Text("Universitaire 2e cycle 1 an ou + (${_lev9} points)"),
                value: _checkedLev9,
                onChanged: (age) {
                  setState(() {
                    _checkedLev9 = age;
                    if (_checkedLev9)
                      _totalLev += _lev9;
                    else
                      _totalLev -= _lev9;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("Universitaire 3e cycle (${_lev10} points)"),
                value: _checkedLev10,
                onChanged: (age) {
                  setState(() {
                    _checkedLev10 = age;
                    if (_checkedLev10)
                      _totalLev += _lev10;
                    else
                      _totalLev -= _lev10;
                  });
                },
              ),
              Text("Total age = ${_totalLev}"),
              RaisedButton(
                child: Text("Next page"),
                onPressed: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new NextPage(value: _totalLev),
                  );
                  Navigator.of(context).push(route);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  int value;

  NextPage({Key key, this.value}) : super(key: key);

  @override
  _NextPageState createState() => new _NextPageState();
}

class _NextPageState extends State<NextPage> {
  int _test1 = 5, _test2 = 66;
  bool _checketest1 = false, _checketest2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            CheckboxListTile(
              title: Text("Age ${_test1}"),
              value: _checketest1,
              onChanged: (age) {
                setState(() {
                  _checketest1 = age;
                  if (_checketest1)
                    widget.value += _test1;
                  else
                    widget.value -= _test1;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Age ${_test2}"),
              value: _checketest2,
              onChanged: (age) {
                setState(() {
                  _checketest2 = age;
                  if (_checketest2)
                    widget.value += _test2;
                  else
                    widget.value -= _test2;
                });
              },
            ),
            Text("Total age2 = ${widget.value}"),
          ],
        ),
      ),
    );
  }
}
