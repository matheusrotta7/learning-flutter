import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int score;
  final void Function() resetQuestions;

  const Resultado(this.score, this.resetQuestions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'Parabens! Sua pontuação foi $score',
            style: TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(onPressed: resetQuestions, child: Text('Reset'))
      ],
    );
  }
}
