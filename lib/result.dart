import 'package:flutter/material.dart';
import 'models/answer_model.dart'; // Import AnswerModel

class ResultScreen extends StatelessWidget {
  final List<AnswerModel> answers;

  ResultScreen({required this.answers});

  @override
  Widget build(BuildContext context) {
    bool isComplete = answers.length == 2; // Assuming there are 2 stages

    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Kuiz'),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          if (isComplete) // Show result only if all stages are complete
            Container(
              color: Colors.green,
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Nilai',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Text(
                    '100',
                    style: TextStyle(fontSize: 48, color: Colors.white),
                  ),
                  Text(
                    'Selamat!\nKamu tidak mengalami gangguan belajar',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: answers.length,
              itemBuilder: (context, index) {
                final answer = answers[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${answer.stage}'),
                  ),
                  title: Text('Stage ${answer.stage}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Soal ke ${answer.question}'),
                      Text('Jawaban: ${answer.answer}'), // Display the answer
                    ],
                  ),
                  trailing: Icon(Icons.check, color: Colors.green),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
