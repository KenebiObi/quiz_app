import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  StartScreen(
    this.switchScreen, {
    super.key,
  });
  final void Function() switchScreen;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300.0,
            color: const Color.fromARGB(161, 255, 255, 255),
          ),
          const SizedBox(height: 50.0),
          Text(
            "Learn FLutter the fun way!",
            style: GoogleFonts.nunito(
              fontSize: 20.0,
              color: const Color.fromARGB(255, 237, 223, 252),
            ),
          ),
          const SizedBox(height: 50.0),
          OutlinedButton.icon(
            onPressed: () {
              switchScreen();
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
            icon: const Icon(Icons.arrow_right),
          )
        ],
      ),
    );
  }
}
