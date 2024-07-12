import 'package:flutter/material.dart';
import 'dart:async'; // Import for Timer
import 'stage1.dart';
import 'stage2.dart';
import 'result.dart'; // Import ResultScreen
import 'models/answer_model.dart'; // Import AnswerModel

class GameScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  final List<AnswerModel> answers; // Accept answers list as a parameter

  GameScreen({required this.answers}); // Add named parameter 'answers'

  @override
  Widget build(BuildContext context) {
    // Reset answers when starting the game
    answers.clear();

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(), // Disable swipe
        children: [
          StageSplashScreen(stage: 1, pageController: _pageController),
          ...stage1Screens(_pageController, answers),
          StageSplashScreen(stage: 2, pageController: _pageController),
          ...stage2Screens(_pageController, answers),
          EndScreen(
              answers: answers,
              pageController: _pageController), // Pass answers to EndScreen
        ],
      ),
    );
  }
}

class StageSplashScreen extends StatelessWidget {
  final int stage;
  final PageController pageController;

  StageSplashScreen({required this.stage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });

    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Text(
          'STAGE $stage',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class EndScreen extends StatelessWidget {
  final List<AnswerModel> answers;
  final PageController pageController;

  EndScreen({required this.answers, required this.pageController});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(answers: answers),
        ),
      );
    });

    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Text(
          'SELESAI',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ResultSplashScreen extends StatelessWidget {
  final List<AnswerModel> answers;

  ResultSplashScreen({required this.answers});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(answers: answers),
        ),
      );
    });

    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Text(
          'Lihat Hasil',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
