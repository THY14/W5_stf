import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body:Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        color: Colors.green,
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ScoreCard(subject: "flutter", defaultScore: 5),
            ScoreCard(subject: "dart", defaultScore: 3),
            ScoreCard(subject: "React", defaultScore: 9),
          ],
        ),
      )
    ),
  ));
}

class ScoreCard extends StatefulWidget {
  const ScoreCard({super.key, required this.subject, required this.defaultScore});

  final String subject;
  final int defaultScore;

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {

  late int score;

  @override
  void initState() {
    super.initState();
    score=widget.defaultScore;
  }

  void addScore(){
    setState(() {
      score=(score==10)?10:score+1;
    });
  }

  void removeScore(){
    setState(() {
      score=(score==0)?0:score-1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("My Score in ${widget.subject}",
            style: TextStyle(
              fontSize: 32
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: removeScore,
                child: Text("-",
                  style: TextStyle(
                    fontSize: 32
                  ),
                ),
              ),
              SizedBox(
                width: 100,
              ),
              TextButton(
                onPressed: addScore,
                child: Text("+",
                  style: TextStyle(
                    fontSize: 32
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 80,
            width:600,
            decoration: BoxDecoration(
              border: BoxBorder.all(
                color: Colors.grey,
                width: 2
              ),
              borderRadius:BorderRadius.circular(20)
            ),
            
            child: LayoutBuilder(
              builder: (context, constraints) {
                double barWidth = (score / 10) * constraints.maxWidth;
                return Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: barWidth,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
