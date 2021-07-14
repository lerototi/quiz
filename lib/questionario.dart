import 'package:flutter/material.dart';
import 'package:quiz/questoes.dart';
import 'package:quiz/resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String,Object>> perguntas;
  final void Function(int) quantoResponder;

  const Questionario({Key ? key, 
  required this.perguntaSelecionada, 
  required this.perguntas, 
  required this.quantoResponder}) : super(key: key);

    bool get temPerguntaSelecionada {
      return perguntaSelecionada < perguntas.length;
    }

  @override
  Widget build(BuildContext context) {

List<Map<String, Object>> respostas = temPerguntaSelecionada ? 
    perguntas[perguntaSelecionada].cast()['respostas'] : [];

    


    return Column(
          children: [
            Questao(texto: perguntas[perguntaSelecionada]['texto'].toString()),
            ...respostas
            .map((resp) {
              return Resposta(
              texto: resp['texto'].toString(), 
               quandoSelecionado: () => quantoResponder(int.parse(resp['pontuacao'].toString())));
            }).toList(),
          ],
        );
  }
}