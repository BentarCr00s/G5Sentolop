import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Screen'),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          StageScreen(pageController: _pageController, stageNumber: 1),
          GameContentScreen(pageController: _pageController),
          StageScreen(pageController: _pageController, stageNumber: 2),
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Stage $stageNumber',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to the next page in PageView
              pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: Text('Start Game'),
          ),
        ],
      ),
    );
  }
}

class GameContentScreen extends StatelessWidget {
  final PageController pageController;

  GameContentScreen({required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Berapa jumlah suku kata dari kata-kata ini?',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Image.asset('assets/singa.png'), // Replace with your image asset
          Text(
            'Si-nga',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  child: Text('${index + 1}'),
                ),
              );
            }),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to the next page in PageView
              pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: Text('Konfirmasi'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          ),
        ],
      ),
    );
  }
}
