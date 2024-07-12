import 'package:flutter/material.dart';
import 'models/answer_model.dart'; // Import AnswerModel


List<Widget> stage1Screens(
    PageController pageController, List<AnswerModel> answers) {
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
      backgroundColor: Color(0xFFFFF8EC),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 24.0), // Adjusted margin
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Center align text
            children: [
              Center(
                child: Text(
                  'Berapa jumlah suku kata dari kata-kata ini?',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center, // Center align text
                ),
              ),
              SizedBox(height: 20),
              Image.asset('assets/singa.png'),
              Text(
                'Si-nga',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedAnswer = index + 1;
                        });
                      },
                      child: Text('${index + 1}'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedAnswer == index + 1
                            ? Color(0xFFF7C200)
                            : Colors.white,
                        foregroundColor: Colors.black,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: selectedAnswer == null
              ? null
              : () {
                  widget.answers.add(AnswerModel(
                      stage: 1, question: 1, answer: selectedAnswer));
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
            backgroundColor:
                selectedAnswer == null ? Colors.grey : Colors.green,
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
      backgroundColor: Color(0xFFFFF8EC),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 24.0), // Adjusted margin
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Center align text
            children: [
              Center(
                child: Text(
                  'Berapa jumlah suku kata dari kata-kata ini?',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center, // Center align text
                ),
              ),
              SizedBox(height: 20),
              Image.asset('assets/harimau.png'),
              Text(
                'Ha-ri-mau',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedAnswer = index + 1;
                        });
                      },
                      child: Text('${index + 1}'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedAnswer == index + 1
                            ? Color(0xFFF7C200)
                            : Colors.white,
                        foregroundColor: Colors.black,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: selectedAnswer == null
              ? null
              : () {
                  widget.answers.add(AnswerModel(
                      stage: 1, question: 2, answer: selectedAnswer));
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
            backgroundColor:
                selectedAnswer == null ? Colors.grey : Colors.green,
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
      backgroundColor: Color(0xFFFFF8EC),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0), //
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Center align text
            children: [
              Center(
                child: Text(
                  'Berapa jumlah suku kata dari kata-kata ini?',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center, // Center align text
                ),
              ),
              SizedBox(height: 20),
              Image.asset('assets/gajah.png'),
              Text(
                'Ga-jah',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedAnswer = index + 1;
                        });
                      },
                      child: Text('${index + 1}'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedAnswer == index + 1
                            ? Color(0xFFF7C200)
                            : Colors.white,
                        foregroundColor: Colors.black,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: selectedAnswer == null
              ? null
              : () {
                  widget.answers.add(AnswerModel(
                      stage: 1, question: 3, answer: selectedAnswer));
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
            backgroundColor:
                selectedAnswer == null ? Colors.grey : Colors.green,
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
      backgroundColor: Color(0xFFFFF8EC),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 24.0), // Adjusted margin
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Center align text
            children: [
              Text(
                'Tunjukkan kata yang benar!',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center, // Center align text
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
                      child: Text('Gajh'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(80, 80),
                        backgroundColor: selectedAnswer == 1
                            ? Color(0xFFF7C200)
                            : Colors.white,
                        foregroundColor: Colors.black,
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
                      child: Text('Gjah'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(80, 80),
                        backgroundColor: selectedAnswer == 2
                            ? Color(0xFFF7C200)
                            : Colors.white,
                        foregroundColor: Colors.black,
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
                          selectedAnswer = 3;
                        });
                      },
                      child: Text('Gajah'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(80, 80),
                        backgroundColor: selectedAnswer == 3
                            ? Color(0xFFF7C200)
                            : Colors.white,
                        foregroundColor: Colors.black,
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
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: selectedAnswer == null
              ? null
              : () {
                  widget.answers.add(AnswerModel(
                      stage: 1, question: 4, answer: selectedAnswer));
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
            backgroundColor:
                selectedAnswer == null ? Colors.grey : Colors.green,
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
      backgroundColor: Color(0xFFFFF8EC),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 24.0), // Adjusted margin
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Center align text
            children: [
              Text(
                'Cari huruf S',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center, // Center align text
              ),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedAnswer = index;
                      });
                    },
                    child: Text(index == 4 ? 'S' : '5'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(80, 80),
                      backgroundColor: selectedAnswer == index
                          ? Color(0xFFF7C200)
                          : Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: selectedAnswer == null
              ? null
              : () {
                  widget.answers.add(AnswerModel(
                      stage: 1, question: 5, answer: selectedAnswer));
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
            backgroundColor:
                selectedAnswer == null ? Colors.grey : Colors.green,
            minimumSize: Size(double.infinity, 50),
          ),
        ),
      ),
    );
  }
}
