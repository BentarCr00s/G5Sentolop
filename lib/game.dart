import 'package:flutter/material.dart';
import 'stage1.dart';
import 'stage2.dart';
import 'result.dart';
import 'models/answer_model.dart'; // Import AnswerModel

class GameScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  final List<AnswerModel> _answers = []; // List to store answers

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          StageScreen(pageController: _pageController, stageNumber: 1),
          ...stage1Screens(_pageController, _answers),
          StageScreen(pageController: _pageController, stageNumber: 2),
          ...stage2Screens(_pageController, _answers),
          EndScreen(answers: _answers), // Pass answers to EndScreen
        ],
      ),
    );
  }
}

class StageScreen extends StatelessWidget {
  final PageController pageController;
  final int stageNumber;

  StageScreen({required this.pageController, required this.stageNumber});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      },
      child: Container(
        color: Colors.yellow,
        child: Center(
          child: Text(
            'Stage $stageNumber',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
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
                  builder: (context) => ResultScreen(answers: answers),
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