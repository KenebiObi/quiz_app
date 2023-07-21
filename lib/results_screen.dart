import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.restartQuiz,
    // required this.resetSelectedAnswersList,
  });
  final List<String> chosenAnswers;
  final void Function() restartQuiz;
  // final void Function() resetSelectedAnswersList;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].question,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numtotalQuestions = questions.length;
    final numCorrectanswers = summaryData.where(
      (data) {
        return data['correct_answer'] == data['user_answer'];
      },
    ).length;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You answered $numCorrectanswers out of $numtotalQuestions questions correctly",
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              fontSize: 20.0,
              color: const Color.fromARGB(255, 223, 181, 252),
            ),
          ),
          const SizedBox(height: 30.0),
          // Text(
          //   "List of answers...",
          //   textAlign: TextAlign.center,
          //   style: GoogleFonts.robotoSlab(fontSize: 15.0),
          // ),
          QuestionsSummary(summaryData: getSummaryData()),
          const SizedBox(height: 30.0),
          OutlinedButton.icon(
            onPressed: () {
              restartQuiz();
              // resetSelectedAnswersList();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
              ),
            ),
            label: Text(
              "Start Quiz",
              style: GoogleFonts.robotoSlab(),
            ),
            icon: const Icon(Icons.replay),
          )
        ],
      ),
    );
  }
}
