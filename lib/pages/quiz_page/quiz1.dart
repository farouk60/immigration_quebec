import 'package:flutter/material.dart';


var finalScore = 0;
var questionNumber = 0;
var quiz = new QuebecQuiz();

class QuebecQuiz{
  var images = [
    "quebecflag", "quebecflag", "quebecflag", "quebecflag", "quebecflag", "quebecflag", "quebecflag"
  ];


  var questions = [
    "Le Fleurdelisé, le drapeau actuel du Québec, a été adopté en 1948. Quel est le nom de son prédécesseur?",
    "Comme tous les Canadiens, les Québécois furent appelés à voter lors d’un référendum national en octobre 1992. Sur quoi se sont-ils prononcés?",
    "Aux Jeux Olympiques d’hiver de Sarajevo en 1984, ce patineur de vitesse a remporté deux médailles d’or et une médaille de bronze.",
    "Quel est l’emblème aviaire du Québec?",
    "À combien d’habitants s’élève la population du Québec?",
    "Quel événement historique est désormais souligné chaque année au Québec le lundi précédant le 25 mai?"
    "Quel nom donne-t-on couramment au drapeau du Québec?"
  ];


  var choices = [
    ["Le Carillon moderne", "Le Quebec Blue ensign", "L’Union Jack", "Le Tricolore canadien"],
    ["L’Accord du lac Meech", "L’Accord de Charlottetown", "Le registre des armes à feu", "La tenue de Jeux Olympiques à Québec en 2002"],
    ["Marc Gagnon", "Pierre Harvey", "Gaétan Boucher", "Guy Lafleur"],
    [" Le pigeon voyageur", "Le harfang des neiges", "Le huard", "Le moineau"],
    ["11 251 003", " 9.415.887", "7.685.558", "8.326.089"],
    ["Les rébellions des patriotes de 1837-1838", "L’acquisition du droit de vote pour les femmes", "L’instauration de la loi 101", "L’arrivée de Champlain en Amérique"],
    ["La croix blanche","La beauté bleue","Le fleurdelisé","L’unifolié"],
  ];


  var correctAnswers = [
    "Le Carillon moderne", "L’Accord du lac Meech", "Gaétan Boucher", "Le harfang des neiges", "8.326.089", "Les rébellions des patriotes de 1837-1838", "Le fleurdelisé"];
}

class QubecEconomy extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new QubecEconomyState();
  }
}

class QubecEconomyState extends State<QubecEconomy> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(

          body: Padding(
            padding: const EdgeInsets.all(8.0),

            child: new SingleChildScrollView(

              child: new Column(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.all(10.0)),

                  new Container(
                    alignment: Alignment.centerRight,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        new Text("Question ${questionNumber + 1} sur ${quiz.questions.length}",
                          style: new TextStyle(
                              fontSize: 22.0
                          ),),

                        new Text("Correct: $finalScore",
                          style: new TextStyle(
                              fontSize: 22.0
                          ),)
                      ],
                    ),
                  ),


                  //image
                  new Padding(padding: EdgeInsets.all(10.0)),

                  new Image.asset(
                    "images/${quiz.images[questionNumber]}.png",
                  ),

                  new Padding(padding: EdgeInsets.all(20.0)),

                  new Text(quiz.questions[questionNumber],
                    style: new TextStyle(
                      fontSize: 20.0,
                    ),),

                  new Padding(padding: EdgeInsets.all(20.0)),

                  new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      //button 1
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: new MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minWidth: 120.0,
                          color: Colors.blueGrey,
                          onPressed: (){
                            if(quiz.choices[questionNumber][0] == quiz.correctAnswers[questionNumber]){
                              finalScore++;
                            }else{
                            }
                            updateQuestion();
                          },
                          child: new Text(quiz.choices[questionNumber][0],
                            style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                            ),),
                        ),
                      ),

                      //button 2
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: new MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minWidth: 120.0,
                          color: Colors.blueGrey,
                          onPressed: (){

                            if(quiz.choices[questionNumber][1] == quiz.correctAnswers[questionNumber]){
                              finalScore++;
                            }else{
                            }
                            updateQuestion();
                          },
                          child: new Text(quiz.choices[questionNumber][1],
                            style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                            ),),
                        ),
                      ),

                    ],
                  ),

                  new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      //button 3
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: new MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minWidth: 120.0,
                          color: Colors.blueGrey,
                          onPressed: (){

                            if(quiz.choices[questionNumber][2] == quiz.correctAnswers[questionNumber]){
                              finalScore++;
                            }else{
                            }
                            updateQuestion();
                          },
                          child: new Text(quiz.choices[questionNumber][2],
                            style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                            ),),
                        ),
                      ),

                      //button 4
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: new MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minWidth: 120.0,
                          color: Colors.blueGrey,
                          onPressed: (){

                            if(quiz.choices[questionNumber][3] == quiz.correctAnswers[questionNumber]){
                              finalScore++;
                            }else{
                            }
                            updateQuestion();
                          },
                          child: new Text(quiz.choices[questionNumber][3],
                            style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                            ),),
                        ),
                      ),

                    ],
                  ),

                  new Padding(padding: EdgeInsets.all(10.0)),

                  new Container(
                      alignment: Alignment.bottomCenter,
                      child:  new MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minWidth: 240.0,
                          height: 30.0,
                          color: Colors.red,
                          onPressed: resetQuiz,
                          child: new Text("Quittez Quebec Quiz",
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.white
                            ),)
                      )
                  ),




                ],
              ),
            ),
          ),

        )
    );
  }

  void resetQuiz(){
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }



  void updateQuestion(){
    setState(() {
      if(questionNumber == quiz.questions.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Summary(score: finalScore,)));

      }else{
        questionNumber++;
      }
    });
  }
}


class Summary extends StatelessWidget{
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(

        body: new Container(
          child: Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                new Text("Score Final: $score",
                  style: new TextStyle(
                      fontSize: 35.0
                  ),),

                new Padding(padding: EdgeInsets.all(30.0)),

                new MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.red,
                  onPressed: (){
                    questionNumber = 0;
                    finalScore = 0;
                    Navigator.pop(context);
                  },
                  child: new Text("Reset Quebec Quiz",
                    style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.white
                    ),),)

              ],
            ),
          ),
        ),


      ),
    );
  }


}