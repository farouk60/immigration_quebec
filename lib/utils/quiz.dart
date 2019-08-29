import 'package:immigration_quebec/utils/models/reddit.dart';
import 'package:immigration_quebec/utils/question.dart';

class Quiz {
  List<Question> _questions = [];
  List<Post> _posts = [];
  List<String> _answers = [];
  int _currentQuestion = -1;
  int _score = 0;

  Quiz(this._posts) {
    _posts.forEach((post) {
      if (post.response != null &&
          post.response.contains('Ouija says: ') &&
          post.text.isEmpty) {
        String response = post.response.replaceAll('Ouija says: ', '');
        int numOfLetters =
            Set.from(response.replaceAll(RegExp(r'\W'), '').split('')).length;
        if (response.contains(RegExp('[0-9a-bA-Z]+')) &&
            !post.title.contains('Please read the rules') &&
            numOfLetters >= 3) {
          _questions.add(Question(post.title, response, post.url));
          _answers.add(response);
        }
      }
    });
  }

  List<Question> get questions => _questions;
  List<String> get answers => _answers;
  int get length => _questions.length;
  int get questionNumber => _currentQuestion + 1;
  int get score => _score;

  Question get nextQuestion {
    _currentQuestion++;
    if (_currentQuestion >= length) {
      print('Out of questions');
      return null;
    }
    return _questions[_currentQuestion];
  }

  void answer(bool isCorrect) {
    if (isCorrect) {
      _score++;
    }
  }
}
