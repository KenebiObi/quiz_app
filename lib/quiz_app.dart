import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({
    super.key,
  });
  @override
  State<QuizApp> createState() {
    return _QuizApptate();
  }
}

class _QuizApptate extends State<QuizApp> {
  // Widget activeScreen = StartScreen(switchScreen);
  String activeScreen = "start_screen";
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = "questions_screen";
    });
  }

  void chooseAnwer(String answer) {
    // function that adds to the list of answers and accepts a string
    selectedAnswers.add(answer);
    print(selectedAnswers.length);
    print(questions.length);
    if (selectedAnswers.length == questions.length) {
      setState(
        () {
          activeScreen = "results_screen";
          print("Done");
          // selectedAnswers = [];
        },
      );
    }
  }

  // void resetSelectedAnswersList() {
  //   setState(() {
  //     selectedAnswers = [];
  //     print("Reset");
  //   });
  // }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = "questions_screen";
      print("Restart");
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == "questions_screen") {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnwer);
    }

    if (activeScreen == "results_screen") {
      screenWidget = ResultsScreen(
        // resetSelectedAnswersList: resetSelectedAnswersList,
        restartQuiz: restartQuiz,
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
