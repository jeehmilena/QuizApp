import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final String answer;
  final void Function() onPressed;

  const Answers(this.answer, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
        onPressed: onPressed,
        child: Text(answer),
      ),
    );
  }
}
