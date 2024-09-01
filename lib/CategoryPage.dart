import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/QuestionScreen.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage(this.startQuestion, this.BackgroundColor, {super.key});

  final void Function(String) startQuestion;
  final List<Color> BackgroundColor;

  void _navigateToQuestionsuScreen(String category, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            QuestionScreen.withCategory(category, BackgroundColor)));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: BackgroundColor,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        image: const DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
            child: Text(
              "Choose Your Quiz Vibe and Dive In!",
              style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: OutlinedButton.icon(
                label: Text(
                  'Football',
                  style: GoogleFonts.lato(color: Colors.white),
                ),
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 102, 24, 116),
                    fixedSize: const Size(200, 20)),
                onPressed: () {
                  _navigateToQuestionsuScreen('Football(soccer)', context);
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: OutlinedButton.icon(
                label: Text(
                  'History',
                  style: GoogleFonts.lato(color: Colors.white),
                ),
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 102, 24, 116),
                    fixedSize: const Size(200, 20)),
                onPressed: () {
                  _navigateToQuestionsuScreen('History', context);
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: OutlinedButton.icon(
                label: Text(
                  'General Knowledge',
                  style: GoogleFonts.lato(color: Colors.white),
                ),
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 102, 24, 116),
                    fixedSize: const Size(200, 20)),
                onPressed: () {
                  _navigateToQuestionsuScreen('General Knowledge', context);
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: OutlinedButton.icon(
                label: Text(
                  'Maths',
                  style: GoogleFonts.lato(color: Colors.white),
                ),
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 102, 24, 116),
                    fixedSize: const Size(200, 20)),
                onPressed: () {
                  _navigateToQuestionsuScreen('Maths', context);
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: OutlinedButton.icon(
                label: const Text('Science'),
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 102, 24, 116),
                    fixedSize: const Size(200, 20)),
                onPressed: () {
                  _navigateToQuestionsuScreen('Science', context);
                }),
          )
        ]),
      ),
    );
  }
}
