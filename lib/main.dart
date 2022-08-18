import 'package:flutter/material.dart';
import 'package:flutter_quiz_apps/pages/question_page.dart';
import 'package:flutter_quiz_apps/pages/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: QuestionPage.routeName,
      routes: {
        QuestionPage.routeName : (context) => QuestionPage(),
        ResultPage.routeName : (context) => ResultPage(),
      },
    );
  }
}

