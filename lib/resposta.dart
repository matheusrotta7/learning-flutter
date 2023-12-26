import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String text;
  final void Function() answer;

  const Resposta(this.text, this.answer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        onPressed: answer,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
