import 'package:flutter/material.dart';
import 'package:quiz_project/widgets/question.dart';

import 'answers.dart';

class Quiz extends StatelessWidget {
  final int selectedQuestion;
  final List<Map<String, Object>> questions;
  final void Function(int) respond;

  const Quiz(
      {required this.selectedQuestion, required this.questions, required this.respond, Key? key})
      : super(key: key);

  bool get haveQuestionSelected {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers =
        haveQuestionSelected ? questions[selectedQuestion].cast()['answers'] : [];

    return Column(
      children: [
        Question(questions[selectedQuestion]['question'].toString()),
        ...answers.map((answer) {
          return Answers(
            answer['answer'] as String,
            () => respond(int.parse(answer['score'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
