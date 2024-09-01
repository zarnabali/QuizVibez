// ignore: file_names
class Question {
  String text;
  List<String> answers;

  Question(this.text, this.answers);

  @override
  String toString() {
    return 'Question: $text\nAnswers: ${answers.join(', ')}';
  }

  void display() {
    print(text);
    print(answers);
  }

  void setText(String t) {
    text = t;
  }

  void setAnswers(List<String> ans) {
    answers = ans;
  }

  List<String> getShuffledAnswer() {
    final shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
