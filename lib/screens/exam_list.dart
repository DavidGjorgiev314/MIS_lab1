import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  final List<Exam> exams = [
    Exam(subjectName: "Мобилни информациски системи", dateTime: DateTime(2025, 11, 28, 9, 0), rooms: ["Лаб 138", "Лаб 117"]),
    Exam(subjectName: "Бази на податоци", dateTime: DateTime(2025, 11, 17, 11, 0), rooms: ["200АБ"]),
    Exam(subjectName: "Алгоритми и податочни структури", dateTime: DateTime(2025, 11, 11, 10, 0), rooms: ["Лаб 12"]),
    Exam(subjectName: "Веб програмирање", dateTime: DateTime(2025, 11, 9, 13, 0), rooms: ["Лаб 13"]),
    Exam(subjectName: "Компјутерски мрежи и безбедност", dateTime: DateTime(2025, 11, 19, 9, 0), rooms: ["Лаб 315"]),
    Exam(subjectName: "Калкулус 1", dateTime: DateTime(2025, 11, 22, 8, 0), rooms: ["200Б"]),
    Exam(subjectName: "Основи на роботика", dateTime: DateTime(2025, 11, 30, 10, 0), rooms: ["Барака 2.2"]),
    Exam(subjectName: "Вештачка интелигенција", dateTime: DateTime(2025, 11, 2, 9, 30), rooms: ["Лаб 215"]),
    Exam(subjectName: "Архитектура и организација на компјутери", dateTime: DateTime(2025, 11, 15, 12, 0), rooms: ["200АБ"]),
    Exam(subjectName: "Софтверско инженерство", dateTime: DateTime(2025, 11, 17, 11, 0), rooms: ["Лаб 315"]),
  ];

  ExamListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Распоред за испити - 213095"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                final exam = exams[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExamDetailScreen(exam: exam),
                      ),
                    );
                  },
                  child: ExamCard(exam: exam),
                );
              },
            ),
          ),
          Container(
            color: Colors.blueGrey[50],
            padding: const EdgeInsets.all(12),
            child: Text(
              "Вкупно испити: ${exams.length}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}