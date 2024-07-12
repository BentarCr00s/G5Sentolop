import 'package:flutter/material.dart';
import 'result.dart';
import 'models/answer_model.dart'; // Import AnswerModel

List<Widget> stage2Screens(PageController pageController, List<AnswerModel> answers) {
  return [
    Soal1(pageController: pageController, answers: answers),
    Soal2(pageController: pageController, answers: answers),
    Soal3(pageController: pageController, answers: answers),
    Soal4(pageController: pageController, answers: answers),
    Soal5(pageController: pageController, answers: answers),
  ];
}

class Soal1 extends StatefulWidget {
  final PageController pageController;
  final List<AnswerModel> answers;

  Soal1({required this.pageController, required this.answers});

  @override
  _Soal1State createState() => _Soal1State();
}

class _Soal1State extends State<Soal1> {
  int? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Text(
                  'Isilah titik-titik dengan tanda yang benar!',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '4 ... 5',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedAnswer = 1;
                      });
                    },
                    child: Text('<'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedAnswer == 1
                          ? Color(0xFFF7C200)
                          : Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: Size(80, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedAnswer = 2;
                      });
                    },
                    child: Text('>'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedAnswer == 2
                          ? Color(0xFFF7C200)
                          : Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: Size(80, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            widget.answers.add(AnswerModel(stage: 2, question: 1, answer: selectedAnswer));
            widget.pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          },
          child: Text(
            'Konfirmasi',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: Size(double.infinity, 50),
          ),
        ),
      ),
    );
  }
}

class Soal2 extends StatefulWidget {
  final PageController pageController;
  final List<AnswerModel> answers;

  Soal2({required this.pageController, required this.answers});

  @override
  _Soal2State createState() => _Soal2State();
}

class _Soal2State extends State<Soal2> {
  int? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Text(
                  'Hitunglah penjumlahan berikut!',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '3 + 2 = ?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedAnswer = 1;
                      });
                    },
                    child: Text('4'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedAnswer == 1
                          ? Color(0xFFF7C200)
                          : Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: Size(80, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedAnswer = 2;
                      });
                    },
                    child: Text('5'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedAnswer == 2
                          ? Color(0xFFF7C200)
                          : Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: Size(80, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            widget.answers.add(AnswerModel(stage: 2, question: 2, answer: selectedAnswer));
            widget.pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          },
          child: Text(
            'Konfirmasi',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: Size(double.infinity, 50),
          ),
        ),
      ),
    );
  }
}

class Soal3 extends StatefulWidget {
  final PageController pageController;
  final List<AnswerModel> answers;

  Soal3({required this.pageController, required this.answers});

  @override
  _Soal3State createState() => _Soal3State();
}

class _Soal3State extends State<Soal3> {
  int? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Text(
                  'Hitunglah pengurangan berikut!',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '5 - 2 = ?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedAnswer = 1;
                      });
                    },
                    child: Text('2'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedAnswer == 1
                          ? Color(0xFFF7C200)
                          : Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: Size(80, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedAnswer = 2;
                      });
                    },
                    child: Text('3'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedAnswer == 2
                          ? Color(0xFFF7C200)
                          : Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: Size(80, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            widget.answers.add(AnswerModel(stage: 2, question: 3, answer: selectedAnswer));
            widget.pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          },
          child: Text(
            'Konfirmasi',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: Size(double.infinity, 50),
          ),
        ),
      ),
    );
  }
}

class Soal4 extends StatefulWidget {
  final PageController pageController;
  final List<AnswerModel> answers;

  Soal4({required this.pageController, required this.answers});

  @override
  _Soal4State createState() => _Soal4State();
}

class _Soal4State extends State<Soal4> {
  int? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Text(
                  'Pilihlah tanda yang benar!',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '7 ... 6',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedAnswer = 1;
                      });
                    },
                    child: Text('<'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedAnswer == 1
                          ? Color(0xFFF7C200)
                          : Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: Size(80, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedAnswer = 2;
                      });
                    },
                    child: Text('>'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedAnswer == 2
                          ? Color(0xFFF7C200)
                          : Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: Size(80, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            widget.answers.add(AnswerModel(stage: 2, question: 4, answer: selectedAnswer));
            widget.pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          },
          child: Text(
            'Konfirmasi',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: Size(double.infinity, 50),
          ),
        ),
      ),
    );
  }
}

class Soal5 extends StatefulWidget {
  final PageController pageController;
  final List<AnswerModel> answers;

  Soal5({required this.pageController, required this.answers});

  @override
  _Soal5State createState() => _Soal5State();
}

class _Soal5State extends State<Soal5> {
  int? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Text(
                  'Hitunglah perkalian berikut!',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '3 x 3 = ?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedAnswer = 1;
                      });
                    },
                    child: Text('6'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedAnswer == 1
                          ? Color(0xFFF7C200)
                          : Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: Size(80, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedAnswer = 2;
                      });
                    },
                    child: Text('9'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedAnswer == 2
                          ? Color(0xFFF7C200)
                          : Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: Size(80, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            widget.answers.add(AnswerModel(stage: 2, question: 5, answer: selectedAnswer));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(answers: widget.answers),
              ),
            );
          },
          child: Text(
            'Konfirmasi',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: Size(double.infinity, 50),
          ),
        ),
      ),
    );
  }
}