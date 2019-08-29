import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:immigration_quebec/pages/end_page.dart';
import 'package:immigration_quebec/pages/loading_page.dart';
import 'package:immigration_quebec/ui/answer_keyboard.dart';
import 'package:immigration_quebec/ui/question_text.dart';
import 'package:immigration_quebec/utils/answered_question.dart';
import 'package:immigration_quebec/utils/models/reddit.dart';
import 'package:immigration_quebec/utils/question.dart';
import 'package:immigration_quebec/utils/quiz.dart';
import 'package:immigration_quebec/utils/reddit_api.dart';

class QuizPage extends StatefulWidget {
  final int _selectedMode;

  const QuizPage(this._selectedMode);

  @override
  State<StatefulWidget> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> with TickerProviderStateMixin {
  Question _currentQuestion;
  Quiz _quiz;
  String _questionText;
  String _correctAnswer;
  String _questionURL;
  String _userAnswer;
  String _correctLetters = '';
  int _questionNumber;
  int _lives = 5;
  double _height;
  bool _isCorrect;
  bool _loadedData;
  bool _overlayShouldBeVisible = false;
  List<Post> _posts;
  List<AnsweredQuestion> _answeredQuestions = [];
  Set<String> _wrongLetters = Set();
  AnimationController _keyboardCtrl;
  AnimationController _nextBttnCtrl;
  Animation _keyboardAnim;
  Animation _nextBttnAnim;
  GlobalKey _key = GlobalKey();

  String get _kbKey => keyboardKey;

  @override
  void initState() {
    super.initState();
    _getPosts().then((isDone) {
      this.setState(() {
        _loadedData = isDone;
      });
    });
    _keyboardCtrl = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _keyboardAnim = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _keyboardCtrl,
      curve: Curves.fastOutSlowIn,
    ))
      ..addListener(() => this.setState(() {}));

    _nextBttnCtrl = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _nextBttnAnim = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _nextBttnCtrl,
      curve: Curves.fastOutSlowIn,
    ))
      ..addListener(() => this.setState(() {}));
  }

  @override
  void dispose() {
    _keyboardCtrl.dispose();
    super.dispose();
  }

  String _getAnswer() {
    String answer;
    switch (widget._selectedMode) {
      case 0:
        if (_questionNumber == 12) {
          print('Break');
        }
        Random rnd = Random();
        answer = _correctAnswer;
        while (
            answer.replaceAll('_', '').length > _correctAnswer.length ~/ 1.5) {
          int pos = rnd.nextInt(_correctAnswer.length);
          if (_correctAnswer[pos].contains(RegExp(r'\w+'))) {
            answer = answer.replaceAll(answer[pos], '_');
          }
        }
        _correctLetters += answer.replaceAll(RegExp(r'\W'), '');
        break;
      case 1:
        if (_questionNumber == 12) {
          print('Break');
        }
        String lettersOnly = _correctAnswer.replaceAll(RegExp(r'\W'), '');
        answer = _correctAnswer.replaceAll(
            RegExp(
                '(?![${lettersOnly[0]}${lettersOnly[lettersOnly.length - 1]}])[0-9a-zA-Z]'),
            '_');
        _correctLetters += lettersOnly[0];
        _correctLetters += lettersOnly[lettersOnly.length - 1];
        break;
      case 2:
        if (_questionNumber == 12) {
          print('Break');
        }
        return _correctAnswer.replaceAll(RegExp('[0-9a-zA-Z]'), '_');
      default:
        break;
    }
    return answer;
  }

  void _updateAnswer() {
    if (_correctAnswer.contains(_kbKey)) {
      _correctLetters += _kbKey;
      this.setState(() {
        _userAnswer = _correctAnswer.replaceAll(
            RegExp('(?![$_correctLetters])[0-9a-zA-Z]'), '_');
      });
    } else {
      if (!_wrongLetters.contains(_kbKey)) {
        this.setState(() {
          _lives--;
        });
        _wrongLetters.add(_kbKey);
      }
    }
    if (!_userAnswer.contains('_') || _lives <= 0) {
      handleAnswear(_userAnswer);
    }
  }

  Future<bool> _getPosts() async {
    _posts = await getOuijaQandA();
    setState(() {
      _quiz = Quiz(_posts);
      _currentQuestion = _quiz.nextQuestion;
      _questionText = _currentQuestion.question;
      _questionNumber = _quiz.questionNumber;
      _correctAnswer = _currentQuestion.answer;
      _questionURL = _currentQuestion.url;
      _userAnswer = _getAnswer();
    });
    return true;
  }

  void handleAnswear(String answer) {
    _getSize();
    _keyboardCtrl.forward();
    _nextBttnCtrl.forward();
    _isCorrect = _lives > 0;
    if (!_overlayShouldBeVisible) {
      _answeredQuestions.add(AnsweredQuestion(_questionText, _correctAnswer,
          _userAnswer, _isCorrect, _questionURL));
      _quiz.answer(_isCorrect);
    }
    this.setState(() {
      _overlayShouldBeVisible = true;
    });
  }

  void _getSize() {
    final RenderBox bottomPartBox = _key.currentContext.findRenderObject();
    this.setState(() {
      _height = bottomPartBox.size.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    if (_loadedData == null) {
      return LoadingPage();
    }
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey[850],
              Colors.black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: <Widget>[
            QuestionText(_questionText, _questionNumber,
                _overlayShouldBeVisible, _isCorrect, _correctAnswer),
            Stack(
              children: <Widget>[
                Container(
                  key: _key,
                  child: AnimatedBuilder(
                    animation: _keyboardCtrl,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Ouija said: ',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            '$_userAnswer',
                            style: TextStyle(
                              letterSpacing: 10.0,
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                    offset: Offset(1.0, 1.0),
                                    color: Colors.black12)
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildLivesRow(),
                        ),
                        _wrongLetters.isEmpty
                            ? Container()
                            : Text(
                                'Wrong letters: ${_wrongLetters.toString().replaceAll(RegExp(r'{*}*'), '')}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                        AnswerKeyboard(_updateAnswer),
                      ],
                    ),
                    builder: (BuildContext context, Widget child) => Transform(
                          transform: Matrix4.translationValues(
                              _keyboardAnim.value * width, 0.0, 0.0),
                          child: child,
                        ),
                  ),
                ),
                Container(
                  height: _height,
                  width: MediaQuery.of(context).size.width,
                  child: AnimatedBuilder(
                    animation: _nextBttnCtrl,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: IconButton(
                              icon: Icon(
                                Icons.play_arrow,
                                size: 40.0,
                                color: Colors.black,
                              ),
                              onPressed: _handleNextQuestion,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.0),
                          ),
                          Text(
                            'Press to continue',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    builder: (BuildContext context, Widget child) => Transform(
                          transform: Matrix4.translationValues(
                              _nextBttnAnim.value * width, 0.0, 0.0),
                          child: child,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handleNextQuestion() {
    if (25 <= _questionNumber || _questionNumber >= _quiz.length) {
      Navigator.of(context).pushAndRemoveUntil(
          (MaterialPageRoute(
              builder: (BuildContext context) => EndPage(_quiz.score,
                  _quiz.length, _answeredQuestions, widget._selectedMode))),
          (Route route) => route == null);
      return;
    } else {
      _nextBttnCtrl.reverse();
      _keyboardCtrl.reverse();
      _currentQuestion = _quiz.nextQuestion;
      _lives = 5;
      _correctLetters = '';
      _wrongLetters.clear();
      this.setState(
        () {
          _overlayShouldBeVisible = false;
          _questionText = _currentQuestion.question;
          _questionNumber = _quiz.questionNumber;
          _questionURL = _currentQuestion.url;
          _correctAnswer = _currentQuestion.answer;
          _userAnswer = _getAnswer();
        },
      );
    }
  }

  List<Widget> _buildLivesRow() {
    List<Widget> _livesIcons = [];
    for (var i = 0; i < _lives; i++) {
      _livesIcons.add(Container(
        padding: EdgeInsets.all(4.0),
        child: Icon(
          Icons.favorite,
          size: 15.0,
          color: Colors.white,
        ),
      ));
    }
    return _livesIcons;
  }
}
