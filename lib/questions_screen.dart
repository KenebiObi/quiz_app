import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/widgets/answer_button.dart';

import 'models/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});
  final void Function(String) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    setState(() {
      currentQuestionIndex++;
      widget.onSelectAnswer(answer);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex]; // Selecting
    // the questions at each index in the list and assigning them to a variable

    return Scaffold(
      body: Container(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.question,
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontSize: 20.0,
                  color: const Color.fromARGB(255, 223, 181, 252),
                ),
              ),
              const SizedBox(height: 30.0),
              ...currentQuestion.getShuffledAnswers().map(
                    // this is used to dynamically
                    // display the list of widgets inside the column
                    // the three dots are used to add the nested list valuues to the
                    // main list i.e: [1, [2, 3, 4], 5] and cheages it to [1, 2, 3, 4, 4]

                    (answer) => AnswerButton(
                      answer,
                      () {
                        // this method is wrapped inside the curly brackets in order to pevent the method from beign run immediately the button is created
                        answerQuestion(answer); // it is wrapped in the
                        // anonymous function, i.e the curly brackets so that the method is executed only when the onTap function is triggered, i.e when the button is tapped
                      },
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
