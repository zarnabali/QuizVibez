import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/CategoryPage.dart';
import 'package:quiz_app/HomePage.dart';
import 'package:quiz_app/QuestionScreen.dart';

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() {
    return __Quiz();
  }
}

class __Quiz extends State<Quiz> {
  static const List<Color> BackgroundColor = [
    Color.fromARGB(255, 199, 104, 168),
    Color.fromARGB(255, 101, 44, 101)
  ];
  Widget? activeState;

  @override
  void initState() {
    activeState = HomePage(switchScreen, BackgroundColor);
    super.initState();
  }

  void switchScreen(String page) {
    if (page == 'CategoryPage') {
      setState(() {
        activeState = CategoryPage(switchScreen, BackgroundColor);
      });
    } else if (page == 'QuestionScreen') {
      setState(() {
        activeState =
            QuestionScreen.withFunction(switchScreen, BackgroundColor);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: activeState,
      ),
    );
  }
}
