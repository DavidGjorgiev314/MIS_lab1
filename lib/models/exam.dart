class Exam {
  final String subjectName;
  final DateTime dateTime;
  final List<String> rooms;

  Exam({
    required this.subjectName,
    required this.dateTime,
    required this.rooms,
  });

  bool get isPassed {
    return dateTime.isBefore(DateTime.now());
  }
}
