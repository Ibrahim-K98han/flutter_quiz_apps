import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_quiz_apps/pages/result_page.dart';
import 'package:intl/intl.dart';

import '../custome_widget/question_set_widget.dart';
import '../temp_db.dart';

class QuestionPage extends StatefulWidget {
  static const String routeName = '/';
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int duration = 60;
  bool hasQuizStated = false;
  String timeString = '';
  late Timer timer;

  @override
  void didChangeDependencies() {
    setTime();
    super.didChangeDependencies();
  }

  startTimer(){
    timer = Timer.periodic(const Duration(seconds:1),(_) {
      if(duration == 0){
        timer.cancel();
        Navigator.pushReplacementNamed(context, ResultPage.routeName);
      }else{
        setState((){
          duration--;
          setTime();
        });
      }
    });
  }

  setTime(){
    timeString = DateFormat('mm:ss').format(DateTime.fromMillisecondsSinceEpoch(duration * 1000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Quiz'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, ResultPage.routeName),
            child: const Text('FINISH', style: TextStyle(color: Colors.white),),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(timeString, style: TextStyle(fontSize: 40,color: Colors.black),),
            if(!hasQuizStated)ElevatedButton(
                onPressed: (){
                  setState((){
                    hasQuizStated = true;
                  });
                  startTimer();
                },
                child: Text('START QUIZ'),
            ),
            if(hasQuizStated)Expanded(
              child: ListView.builder(
                itemCount: questionList.length,
                itemBuilder: (context, index) {
                  final ques = questionList[index];
                  return QuestionSetView(
                    map: ques,
                    index: index,
                    onAnswered: (value) {
                      questionList[index][givenAnswer] = value;
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
