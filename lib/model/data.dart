import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:quiz_app/model/Question.dart';

Future<List<Question>> generateQuestions(String QuizCategory) async {
  final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: 'AIzaSyCIW80JOuFag5wI7kPoaw6pzYVkigB9ons');
  final content = [
    Content.text(
        'give me 5 intresting quiz questions on $QuizCategory the question should not be too easy also give me 4 options to choose the answer from remember that the first option sould always be the correct option and the format of your reponseshould be ["Question1","option1","option2","option3","option4","Question2","option1","option3","option4","Question3","option1","option3","option4","Question4","option1","option3","option4","Question5","option1","option3","option4"] rememeber your response should alway be in a single line no next line)')
  ];
  final response = await model.generateContent(content);

  String? Response = response.text;
  print('Gemini Response: $Response');

  List<Question> questions = parseQuestions(Response!);

  return questions;
}

List<Question> parseQuestions(String questionString) {
  List<String> parts = questionString
      .substring(1, questionString.length - 1) // Remove the square brackets
      .split('","'); // Split by the separator `","`

  // Remove leading and trailing quotes from each part
  parts = parts.map((part) => part.replaceAll('"', '')).toList();

  // Initialize a list to store the Question objects
  List<Question> questions = [];

  // Loop through the parts list in steps of 5
  for (int i = 0; i < parts.length; i += 5) {
    String text = parts[i];
    List<String> answers = parts.sublist(i + 1, i + 5);
    questions.add(Question(text, answers));
  }

  return questions;
}
