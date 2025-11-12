import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String _getTimeUntilExam() {
    final now = DateTime.now();
    final difference = exam.dateTime.difference(now);

    final days = difference.inDays;
    final hours = difference.inHours % 24;

    if (exam.isPassed) {
      return "Испитот веќе помина.";
    }
    return "$days дена, $hours часа";
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy HH:mm');

    return Scaffold(
      appBar: AppBar(title: Text(exam.subjectName)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Предмет: ${exam.subjectName}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Датум и време: ${dateFormat.format(exam.dateTime)}"),
            const SizedBox(height: 10),
            Text("Простории: ${exam.rooms.join(', ')}"),
            const SizedBox(height: 20),
            Text(
              "Преостанато време: ${_getTimeUntilExam()}",
              style: const TextStyle(fontSize: 18, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}