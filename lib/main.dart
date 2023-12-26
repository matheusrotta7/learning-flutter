import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resposta.dart';
import './questao.dart';

main() {
  runApp(PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  final List<Map<String, Object>> perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco']
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': ['Maria', 'João', 'Leo', 'Pedro'],
    },
  ];

  void responder() {
    setState(() {
      if (perguntaSelecionada + 1 < perguntas.length) {
        perguntaSelecionada++;
      }
    });
    print(perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    List<String> answers = perguntas[perguntaSelecionada].cast()['respostas'];
    List<Widget> answerList = [];
    // if (answers != null) {
    //   for (String textoResp in answers) {
    //     answerList.add(Resposta(textoResp, responder));
    //   }
    // }
    answerList = answers.map((t) => Resposta(t, responder)).toList();

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Perguntas'),
      ),
      body: Column(children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...answerList
      ]),
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
