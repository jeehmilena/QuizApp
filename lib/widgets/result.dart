import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() restartQuiz;

  const Result(this.score, this.restartQuiz, {super.key});

  String get textResult {
    if (score < 8) {
      return 'Parabéns!';
    } else if (score < 12) {
      return 'Você é bom!';
    } else if (score < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(textResult, style: TextStyle(fontSize: 28)),
        ),
        ElevatedButton(
          onPressed: restartQuiz,
          child: Text('Reiniciar', style: TextStyle(fontSize: 18)),
        )
      ],
    );
  }
}
