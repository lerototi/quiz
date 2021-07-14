import 'package:flutter/material.dart';
import 'package:quiz/questionario.dart';
import 'package:quiz/resultado.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState  extends State<PerguntaApp>{

    var _perguntaSelecionada =0;
    var _pontuacaoTotal = 0;
    

    final _perguntas = const [
      {
        'texto':'Qual sua cor favorita?',
        'respostas': [
          {'texto': 'preto', 'pontuacao': 10}, 
          {'texto': 'azul', 'pontuacao': 8}, 
          {'texto': 'branco', 'pontuacao': 3}, 
          {'texto': 'rosa', 'pontuacao': 0}
          ]
      },
      {
        'texto':'Qual o seu animal favorito?',
        'respostas': [
          {'texto':'cachorro', 'pontuacao': 10}, 
          {'texto': 'leão', 'pontuacao': 8 }, 
          {'texto': 'cabra', 'pontuacao': 2}, 
          {'texto': 'Elefante', 'pontuacao' :1}]
      },
      {
        'texto':'Qual o seu professor favorito?',
        'respostas': [
          {'texto': 'joão', 'pontuacao': 10}, 
          {'texto': 'maria', 'pontuacao': 7}, 
          {'texto': 'dudu', 'pontuacao':1}, 
          {'texto': 'zeze', 'pontuacao': 0}]
      }
    ];


    void _responder(int pontuacao) {
      if(temPerguntaSelecionada) {
        setState(() {});
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
      }
         print(_pontuacaoTotal);
    }

      bool get temPerguntaSelecionada {
      return _perguntaSelecionada < _perguntas.length;
    }

    void _reiniciarQuestionario() {
      setState(() {
        _perguntaSelecionada = 0;
        _pontuacaoTotal = 0;
      });
    }
      

  @override
  Widget build(BuildContext context) {

    

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: temPerguntaSelecionada ? Questionario(perguntas: _perguntas,
        perguntaSelecionada: _perguntaSelecionada,
        quantoResponder: _responder,
        )
        : Resultado(pontuacao: _pontuacaoTotal, quandoReiniciarQuestionario: _reiniciarQuestionario),
      ),
    );
  }


}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }



}