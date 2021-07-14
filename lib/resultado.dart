import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;
  const Resultado({Key ? key, required this.pontuacao, required this.quandoReiniciarQuestionario}) : super(key: key);

  


  String get fraseResultado {
    if(pontuacao< 8) {
      return 'Parabens';
    } else if (pontuacao < 12) {
      return 'Voce é bom';
    } else if (pontuacao < 18) {
      return 'Impressionante';
    } else {
      return 'Nível jedi';
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
                child: Text(fraseResultado,
                style: TextStyle(fontSize: 28),),
              ),
              ElevatedButton(onPressed: quandoReiniciarQuestionario, child: Text('Reiniciar'), 
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // background
                onPrimary: Colors.blueAccent, // foreground
  ),),
      ],
    );
  }
}