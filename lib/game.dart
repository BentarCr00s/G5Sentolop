import 'package:flutter/material.dart';
import 'stage1.dart';
import 'stage2.dart';
import 'result.dart'; // Import ResultScreen
import 'models/answer_model.dart'; // Import AnswerModel

class GameScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  final List<AnswerModel> _answers = []; // List to store answers

  @override
  Widget build(BuildContext context) {
    // Reset answers when starting the game
    _answers.clear();

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          ...stage1Screens(_pageController, _answers),
          ...stage2Screens(_pageController, _answers),
          EndScreen(answers: _answers), // Pass answers to EndScreen
        ],
      ),
    );
  }
}

class EndScreen extends StatelessWidget {
  final List<AnswerModel> answers;
  EndScreen({required this.answers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ResultScreen(answers: answers), // Use ResultScreen
                ),
              );
            },
            child: Text(
              'Lihat Hasil',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              minimumSize: Size(200, 50),
            ),
          ),
        ),
      ),
    );
  }
}
