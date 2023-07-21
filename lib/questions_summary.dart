import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450.0,
      child: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...summaryData.map(
              (data) => Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: (data['correct_answer'] as String ==
                                data['user_answer'] as String)
                            ? Colors.blueAccent
                            : const Color.fromARGB(255, 194, 106, 252),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Center(
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: const TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                    const SizedBox(width: 25.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: GoogleFonts.nunito(fontSize: 20.0),
                          ),
                          Text(
                            data['correct_answer'] as String,
                            style: GoogleFonts.robotoSlab(
                              fontSize: 15.0,
                              color: const Color.fromARGB(255, 194, 106, 252),
                            ),
                          ),
                          Text(
                            data['user_answer'] as String,
                            style: GoogleFonts.robotoSlab(
                              fontSize: 15.0,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
