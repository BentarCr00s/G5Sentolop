import 'package:flutter/material.dart';
import 'models/answer_model.dart'; // Import AnswerModel

class ResultScreen extends StatelessWidget {
  final List<AnswerModel> answers;

  ResultScreen({required this.answers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil'),
      ),
      body: ListView.builder(
        itemCount: answers.length,
        itemBuilder: (context, index) {
          final answer = answers[index];
          return ListTile(
            title: Text('Stage ${answer.stage}, Question ${answer.question}'),
            subtitle: Text('Jawaban Anda: ${answer.answer}'),
          );
        },
      ),
    );
  }
}
