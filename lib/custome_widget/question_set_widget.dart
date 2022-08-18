import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_quiz_apps/temp_db.dart';

class QuestionSetView extends StatefulWidget {
  final int index;
  final Map<String, dynamic> map;
  final Function(String) onAnswered;
  const QuestionSetView({Key? key, required this.index,
  required this.map, required this.onAnswered}) : super(key: key);

  @override
  State<QuestionSetView> createState() => _QuestionSetViewState();
}

class _QuestionSetViewState extends State<QuestionSetView> {
  String groupValue = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(0),
          child: ListTile(
            //leading: Text('${widget.index + 1}.'),
            title: Text('${widget.index + 1}.'+widget.map[question],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: (widget.map[options] as List).map((e) => Card(
                //elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: ListTile(
                  onTap: (){},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  tileColor: Colors.amber,
                  leading: Radio<String>(
                    value: e,
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value as String;
                      });
                      widget.onAnswered(groupValue);
                    },
                  ),
                  title: Text(e),
                ),
              )).toList(),
            ),
          ),
        )
      ],
    );
  }
}
