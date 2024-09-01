import 'package:flutter/material.dart';
import 'package:quiz_app/OptionButton.dart';
import 'package:quiz_app/ResultScreen.dart';
import 'package:quiz_app/model/Question.dart';
import 'package:quiz_app/model/data.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  final String category;
  final void Function(String)? startQuestion;
  final List<Color> BackgroundColor;

  const QuestionScreen.withCategory(this.category, this.BackgroundColor,
      {Key? key})
      : startQuestion = null,
        super(key: key);

  const QuestionScreen.withFunction(this.startQuestion, this.BackgroundColor,
      {Key? key})
      : category = '',
        super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late List<Question> finalQuestions = [];
  List<String> saveAnswers = [];
  bool isLoading = true;
  int index = 0;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    try {
      final questions = await generateQuestions(widget.category);
      setState(() {
        finalQuestions = questions;
        isLoading = false;
      });
      print(finalQuestions[0]);

      //print('Printing all the Questions: $finalQuestions');
    } catch (error) {
      print('Error loading questions: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  void _navigateToResultScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ResultsScreen(
            widget.BackgroundColor, saveAnswers, finalQuestions)));
  }

  void chooseAnswer(String option) {
    saveAnswers.add(option);

    if (saveAnswers.length == 5) {
      setState(() {
        _navigateToResultScreen(context);
      });
    }
  }

  void answerQuestion(String option) {
    chooseAnswer(option);
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(finalQuestions[0]);

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: widget.BackgroundColor,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),

            // image: const DecorationImage(
            //   image: AssetImage('assets/images/background.png'),
            //   fit: BoxFit.cover,
            // ),
          ),
          child: Container(
            margin: const EdgeInsets.all(20),
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          finalQuestions[index].text,
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ...finalQuestions[index]
                            .getShuffledAnswer()
                            .map((answer) {
                          return OptionButtton(
                              option: answer,
                              onTap: () {
                                answerQuestion(answer);
                              });
                        })
                      ],
                    ),
                  ),
          )),
    );
  }
}
