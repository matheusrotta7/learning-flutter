import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() {
  runApp(PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _totalScore = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Vermelho', 'nota': 7},
        {'texto': 'Verde', 'nota': 3},
        {'texto': 'Branco', 'nota': 1}
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'nota': 10},
        {'texto': 'Cobra', 'nota': 7},
        {'texto': 'Elefante', 'nota': 3},
        {'texto': 'Leão', 'nota': 1},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'nota': 10},
        {'texto': 'João', 'nota': 7},
        {'texto': 'Leo', 'nota': 3},
        {'texto': 'Pedro', 'nota': 1},
      ],
    },
  ];

  void responder(int score) {
    setState(() {
      _perguntaSelecionada++;
      _totalScore += score;
    });
    print(_perguntaSelecionada);
    print("_totalScore");
    print(_totalScore);
  }

  bool get temPerguntaSelectionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void resetQuestions() {
    setState(() {
      _totalScore = 0;
      _perguntaSelecionada = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (answers != null) {
    //   for (String textoResp in answers) {
    //     answerList.add(Resposta(textoResp, responder));
    //   }
    // }

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Perguntas'),
      ),
      body: temPerguntaSelectionada
          ? Questionario(_perguntas, _perguntaSelecionada, responder)
          : Resultado(_totalScore, resetQuestions),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() {
    return PerguntaAppState();
  }
}
