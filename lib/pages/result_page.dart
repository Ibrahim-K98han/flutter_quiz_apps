import 'package:flutter/material.dart';
import 'package:flutter_quiz_apps/pages/question_page.dart';

import '../temp_db.dart';

class ResultPage extends StatelessWidget {
  static const String routeName = '/result';
  int rightAnswers = 0;
  ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    calculateResult();
    return Scaffold(
      appBar: AppBar(
        title: const Text('RESULT'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/winner.png',height: 200,width: 200,fit: BoxFit.cover,),
            const Text('Correct Answers',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Text('$rightAnswers', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, QuestionPage.routeName);
                  },
                    child: Text('Go Back')
                ),
          ],
        ),
      ),
    );
  }
  calculateResult() {
    for(var map in questionList) {
      if(map[givenAnswer] == map[rightAnswer]) {
        rightAnswers++;
      }
    }
  }
}
