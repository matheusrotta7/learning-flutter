import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;

  final void Function(int) responder;

  Questionario(this.perguntas, this.perguntaSelecionada, this.responder);

  bool get temPerguntaSelectionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = temPerguntaSelectionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(children: [
      Questao(perguntas[perguntaSelecionada]['texto'].toString()),
      ...answers
          .map((resp) => Resposta(resp['texto'].toString(),
              () => responder(int.parse(resp['nota'].toString()))))
          .toList(),
    ]);
  }
}
