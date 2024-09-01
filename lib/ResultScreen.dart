import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Quiz.dart';
import 'package:quiz_app/Summary/Questions_Summary.dart';
import 'package:quiz_app/model/Question.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      this.BackgroundColor, this.chosenAnswers, this.AIQuestions,
      {super.key});

  final List<Color> BackgroundColor;
  final List<String> chosenAnswers;
  final List<Question> AIQuestions;

  // * getter (method not taking input but transforming another property)
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': AIQuestions[i].text,
        'correct_answer': AIQuestions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  void restart(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Quiz()));
  }

  @override
  Widget build(BuildContext context) {
    // final summaryData = getSummary();
    final numTotalQuestions = chosenAnswers.length;
    // * accessing summaryData as a variable because getter method
    final numCorrectQuestions = summaryData
        .where(
          (data) =>
              data['user_answer'] == data['correct_answer'], // arrow function
        )
        .length;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: BackgroundColor,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),

          // image: const DecorationImage(
          //   image: AssetImage('assets/images/background.png'),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 235, 217, 255),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                QuestionsSummary(summaryData),
                const SizedBox(
                  height: 30,
                ),
                TextButton.icon(
                  onPressed: () {
                    restart(context);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Restart Quiz'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
