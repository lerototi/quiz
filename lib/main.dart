import 'package:flutter/material.dart';
import 'package:quiz/questoes.dart';
import 'package:quiz/resposta.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState  extends State<PerguntaApp>{

    var _perguntaSelecionada =0;

    void _responder() {

      setState(() {});
      _perguntaSelecionada++;
      print(_perguntaSelecionada);
    }

  @override
  Widget build(BuildContext context) {

    final List<Map<String, Object>> perguntas = [
      {
        'texto':'Qual sua cor favorita?',
        'respostas': ['preto', 'azul', 'branco', 'rosa']
      },
      {
        'texto':'Qual o seu animal favorito?',
        'respostas': ['cachorro', 'leão', 'cabra', 'Elefante']
      },
      {
        'texto':'Qual o seu professor favorito?',
        'respostas': ['joão', 'maria', 'dudu', 'zeze']
      }
    ];

    List<Widget> respostas = [];

    for( String  textoResp in perguntas[_perguntaSelecionada].cast()['respostas'] ){
      respostas.add(Resposta(texto: textoResp, quandoSelecionado: _responder));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: Column(
          children: [
            Questao(texto: perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas
          ],
        ),
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