import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:quizzie/main.dart';

class FirstRoute extends StatefulWidget {
  final String text;
  final String score;

  FirstRoute({this.text, this.score});

  @override
  firstState createState() => firstState(text, score);
}

class firstState extends State<FirstRoute> {
  String text, score;

  firstState(this.text, this.score);

  ConfettiController mycontroller;

  @override
  void initState() {
    mycontroller = ConfettiController(duration: Duration(seconds: 2));
    mycontroller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: ConfettiWidget(
                confettiController: mycontroller,
                blastDirectionality: BlastDirectionality
                    .explosive,
                shouldLoop:
                    true,
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple
                ], // manually specify the colors to be used
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(

                  child: Text(

                    "Your Score\n" + score + "\n\n"+text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35.0,
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
                  color: Colors.blue,
                  child: Text(
                    'Start a new Quiz',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Quizzler()),

                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
