import 'dart:math';

import 'package:aula_01/resultado.dart';
import 'package:flutter/material.dart';
import 'dados_quiz.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //DadosQuiz dados = DadosQuiz();

  List<Questao> quiz = [];

  int acertos = 0;
  int erros = 0;
  int perguntaAtual = 1;
  String respostaCorreta = "";
  int idRespostaCorreata = 0;

  @override
  Widget build(BuildContext context) {
    if (quiz.length <= 0) {
      gerarQuestoes();
    }
    print(quiz.length);
    idRespostaCorreata = quiz[perguntaAtual].alternativaCorreta;
    for (var element in quiz[perguntaAtual].respostas) {
      if (quiz[perguntaAtual].respostas.indexOf(element) ==
          idRespostaCorreata) {
        respostaCorreta = element;
      }

      print("Resposta: " + respostaCorreta);
    }

    quiz[perguntaAtual].respostas.shuffle();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Quiz Tati")),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Center(
                    child: Text(
                      'Pergunta: \n\n' + quiz[perguntaAtual].pergunta,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        verificaResposta(quiz[perguntaAtual].respostas, 0,
                            quiz[perguntaAtual].alternativaCorreta);

                        // perguntaAtual += 1;
                      },
                      child: Text(
                          "Resposta 01: " + quiz[perguntaAtual].respostas[0]),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        verificaResposta(quiz[perguntaAtual].respostas, 1,
                            quiz[perguntaAtual].alternativaCorreta);
                        //perguntaAtual += 1;
                      },
                      child: Text(
                          "Resposta 01: " + quiz[perguntaAtual].respostas[1]),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        verificaResposta(quiz[perguntaAtual].respostas, 2,
                            quiz[perguntaAtual].alternativaCorreta);
                        //perguntaAtual += 1;
                      },
                      child: Text(
                          "Resposta 01: " + quiz[perguntaAtual].respostas[2]),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        verificaResposta(quiz[perguntaAtual].respostas, 3,
                            quiz[perguntaAtual].alternativaCorreta);
                        //perguntaAtual += 1;
                      },
                      child: Text(
                          "Resposta 01: " + quiz[perguntaAtual].respostas[3]),
                    ),
                  ),
                  Text("pergunta $perguntaAtual de 10"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    //setState(() {});
  }

  void verificaResposta(List respostas, int respostaJogador, int correta) {
    correta = 0;

    for (final r in respostas) {
      if (r == respostaCorreta) {
        correta = respostas.indexOf(r);
      }
    }

    if (respostaJogador == correta) {
      print("ACERTOU!");
      acertos++;
    } else {
      print("ERROU!");
      erros++;
    }

    if (perguntaAtual >= quiz.length - 1) {
      print('terminou');
      Navigator.pushNamed(context, '/Resultados',
          arguments: Argumentos(acertos, erros));
    } else {
      perguntaAtual = perguntaAtual + 1;
      print(perguntaAtual);
    }
    setState(() {});
  }

  void gerarQuestoes() {
    for (int i = 0; i <= 10; i++) {
      var rnd = new Random();
      quiz.add(Questao(
        "$i pergunta",
        [
          "$i aaaaaaaaaa",
          "$i aaaaaaaaaa",
          "$i aaaaaaaaaa",
          "$i aaaaaaaaaa",
        ],
        rnd.nextInt(3),
      ));
    }
  }
}
