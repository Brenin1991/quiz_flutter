import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      'QUIZ BRENIN',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Quiz');
                      },
                      child: Text("JOGAR")),
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
