import 'package:flutter/material.dart';
import 'package:quiz_project/widgets/quiz.dart';
import 'package:quiz_project/widgets/result.dart';

void main() => runApp(const QuizApp());

class QuizAppState extends State<QuizApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'question': 'Qual cor você prefere?',
      'answers': [
        {'answer': 'Preto', 'score': 10},
        {'answer': 'Vermelho', 'score': 5},
        {'answer': 'Azul', 'score': 3},
        {'answer': 'Roxo', 'score': 1},
      ]
    },
    {
      'question': 'Qual é o seu signo?',
      'answers': [
        {'answer': 'Câncer', 'score': 10},
        {'answer': 'Leão', 'score': 5},
        {'answer': 'Virgem', 'score': 3},
        {'answer': 'Nenhuma das opções', 'score': 1},
      ]
    },
    {
      'question': 'Qual é o seu animal favorito?',
      'answers': [
        {'answer': 'Gato', 'score': 10},
        {'answer': 'Cachorro', 'score': 5},
        {'answer': 'Peixes', 'score': 3},
        {'answer': 'Pássaros', 'score': 1},
      ]
    },
    {
      'question': 'Qual cidade você prefere?',
      'answers': [
        {'answer': 'Ubatuba - SP', 'score': 10},
        {'answer': 'Gurupi - TO', 'score': 5},
        {'answer': 'Bonito - MT', 'score': 3},
        {'answer': 'Anápolis - GO', 'score': 1},
      ]
    },
  ];

  bool get haveQuestionSelected {
    return _selectedQuestion < _questions.length;
  }

  void _respond(int pontuacao) {
    if (haveQuestionSelected) {
      setState(() {
        _selectedQuestion++;
        _totalScore += pontuacao;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Quiz')),
        body: haveQuestionSelected
            ? Quiz(selectedQuestion: _selectedQuestion, questions: _questions, respond: _respond)
            : Result(_totalScore, _restartQuiz),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  QuizAppState createState() {
    return QuizAppState();
  }
}
