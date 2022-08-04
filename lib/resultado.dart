import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado({Key? key}) : super(key: key);

  static const routName = '/Resultados';

  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context)?.settings.arguments as Argumentos;
    int acertos = argumentos.acertos;
    int erros = argumentos.erros;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Quiz Tati foda")),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Center(
                    child: Text(
                      'Resultado',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  // ignore: prefer_interpolation_to_compose_strings
                  Text('acertos: $acertos \n erros: $erros'),

                  // SizedBox(
                  //  width: double.infinity,
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Quiz');
                      },
                      child: Text("JOGAR NOVAMENTE")),
                  //),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Argumentos {
  final int acertos;
  final int erros;

  Argumentos(this.acertos, this.erros);
}
