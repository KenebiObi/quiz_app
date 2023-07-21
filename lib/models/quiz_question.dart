import 'package:flutter/material.dart';

class QuizQuestion {
  const QuizQuestion(
    this.question,
    this.answers,
  );
  final String question;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers); // in order to store the original
    // list to prevent it from beigh changed by the shuffle method
    shuffledList.shuffle(); // shuffling the main list
    return shuffledList; // returning the shuffled list
  }
}
