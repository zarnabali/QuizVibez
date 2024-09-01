// ignore: file_names
import "package:flutter/material.dart";
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.startQuiz, this.BackgroundColor, {super.key});

  // ignore: non_constant_identifier_names
  final List<Color> BackgroundColor;
  final void Function(String page) startQuiz;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: BackgroundColor,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Text(
                  "QuizVibez",
                  style: GoogleFonts.lato(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Image.asset(
                  'assets/images/quiz_logo.png',
                  width: 300,
                ),
              ),
              OutlinedButton.icon(
                label: Text(
                  'Begin Quiz',
                  style: GoogleFonts.lato(color: Colors.white),
                ),
                icon: const Icon(Icons.arrow_right_alt),
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                onPressed: () {
                  startQuiz('CategoryPage');
                },
              )
            ],
          ),
        ));
  }
}
