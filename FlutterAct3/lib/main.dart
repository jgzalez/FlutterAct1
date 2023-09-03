import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart'

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Lista para almacenar las preguntas
  List<Question> questions = [];
  // Índice de la pregunta actual
  int currentQuestionIndex = 0;
  // Lista para almacenar los íconos de respuestas correctas/incorrectas
  List<Widget> answerIcons = [];

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  // Función para cargar las preguntas desde el archivo questions.txt
  _loadQuestions() async {
    String questionsTxt = await rootBundle.loadString('source/questions.txt');
    var decoded = json.decode(questionsTxt);
    questions = (decoded['results'] as List)
        .map((questionJson) => Question.fromJson(questionJson))
        .toList();
    setState(() {}); // Refrescar la UI después de cargar las preguntas
  }

  // Función para verificar la respuesta del usuario
  void checkAnswer(bool userAnswer) {
    bool correctAnswer = questions[currentQuestionIndex].correctAnswer;
    setState(() {
      // Agregar ícono de respuesta correcta o incorrecta
      if (userAnswer == correctAnswer) {
        answerIcons.add(Transform.scale(
          scale: 2.0,
          child: Icon(Icons.check, color: Colors.green),
        ));
      } else {
        answerIcons.add(Transform.scale(
          scale: 2.0,
          child: Icon(Icons.close, color: Colors.red),
        ));
      }

      // Pasar a la siguiente pregunta o reiniciar si es la última
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        currentQuestionIndex = 0;
        answerIcons.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Trivia Quiz'),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    questions[currentQuestionIndex].question,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // Botón para respuesta "True"
              SizedBox(
                height: 60,
                width: 300,
                child: Card(
                  color: Colors.green,
                  child: ListTile(
                    title: Center(
                      child: Text(
                        "True",
                        style: TextStyle(),
                      ),
                    ),
                    onTap: () => checkAnswer(true),
                  ),
                ),
              ),
              // Botón para respuesta "False"
              SizedBox(
                height: 60,
                width: 300,
                child: Card(
                  color: Colors.red,
                  child: ListTile(
                    title: Center(
                      child: Text(
                        "False",
                        style: TextStyle(),
                      ),
                    ),
                    onTap: () => checkAnswer(false),
                  ),
                ),
              ),
              // Fila para mostrar los íconos de respuestas
              Row(
                children: answerIcons,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
