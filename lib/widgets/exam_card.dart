import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');

    final now = DateTime.now();
    final isFuture = exam.dateTime.isAfter(now);

    return Card(
      color: exam.isPassed
          ? Colors.red[200]
          : Colors.blue[200],
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(exam.subjectName,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 18),
                const SizedBox(width: 5),
                Text("${dateFormat.format(exam.dateTime)}  ${timeFormat.format(exam.dateTime)}"),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.meeting_room, size: 18),
                const SizedBox(width: 5),
                Text(exam.rooms.join(", ")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}