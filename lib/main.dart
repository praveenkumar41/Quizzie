import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:quizzie/questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'score.dart';

void main() => runApp(MaterialApp(
  home:Quizzler(),
));

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        ),
      ),

    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}


class _QuizPageState extends State<QuizPage> {

  List<Icon> allicons=[];

  int counter=0;
  int nextquestion=0;
  String appre;

  List<Question> question=[

    Question(q:'Sydney is the capital of Australia?',ss:false),
    Question(q:'the five rings on the Olympic flag are interlocking?',ss:true),
    Question(q:'the Penny Black is an old-fashioned coin?',ss:false),
    Question(q:'Some cats are actually allergic to humans',ss: true),
    Question(q:'You can lead a cow down stairs but not up stairs.',ss: false),
    Question(q:'Approximately one quarter of human bones are in the feet.',ss: true),
    Question(q:'A slug\'s blood is green.',ss: true),
    Question(q:'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',ss: true),
    Question(q:'It is illegal to pee in the Ocean in Portugal.',ss: true),
    Question(
        q:'No piece of square dry paper can be folded in half more than 7 times.',ss:
    false),
    Question(
        q:'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        ss:true),
    Question(
        q:'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        ss:false),
    Question(
        q:'The total surface area of two human lungs is approximately 70 square metres.',
        ss:true),
    Question(q:'Google was originally called \"Backrub\".',ss: true),
    Question(
        q:'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        ss:true),
    Question(
        q:'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        ss:true),
  ];


  void trueorfalse(bool current)
  {
    setState(() {

      if(nextquestion==question.length-1)
      {
        if(counter>1 && counter<=5)
        {
          appre="Not Bad";
        }
        if(counter>5 && counter<=8)
        {
          appre="Good";
        }
        else if(counter>8 && counter<15)
        {
          appre="Great";
        }
        else
        {
          appre="Excellent";
        }
/*
      Alert(
        context: context,
        title: "Your score \n"+counter.toString(),
        desc: appre,
      ).show();
*/
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FirstRoute(text: appre,score: counter.toString())),
        );

        //allicons=[];
        //nextquestion=0;
        //counter=0;
      }
      else {
        if (current == true) {
          allicons.add(Icon(Icons.check, color: Colors.green,));
          counter++;
        }
        else {
          allicons.add(Icon(Icons.close_rounded, color: Colors.red,));
        }
        nextquestion++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                question[nextquestion].que,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {

                bool pp=question[nextquestion].tf;
                trueorfalse(pp);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {

                bool pp=question[nextquestion].tf;
                trueorfalse(pp);
              },
            ),
          ),
        ),
        Row(
          children:allicons,
        )
      ],
    );
  }
}
