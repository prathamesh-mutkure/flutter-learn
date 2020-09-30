class Task {
  Task(this.text, {this.isDone = false});

  final String text;
  bool isDone = false;

  void toggleDone() {
    isDone = !isDone;
  }
}
