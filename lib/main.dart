import 'package:flutter/material.dart';
import 'quiz.dart';
import 'resultado.dart';
import 'homepage.dart';

void main() {
  // runApp(Resultado(acertos: 3));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Homepage(),
        '/Quiz': (context) => Quiz(),
        Resultado.routName: (context) => Resultado(),
      },
    );
  }
}
