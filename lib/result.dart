import 'package:flutter/material.dart';
import 'dart:convert'; // Import dart:convert for jsonDecode
import 'models/answer_model.dart'; // Import AnswerModel
import 'main.dart'; // Import halaman utama
import 'package:flutter_gemini/flutter_gemini.dart'; // Import flutter_gemini
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences

class ResultScreen extends StatelessWidget {
  final List<AnswerModel> answers;

  ResultScreen({required this.answers});

  // Kunci jawaban
  final Map<int, List<int>> answerKeys = {
    1: [2, 3, 2, 3, 4], // Stage 1
    2: [1, 2, 2, 2, 2], // Stage 2
  };

  Future<void> _saveResult(String result) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('quiz_result', result);
  }

  @override
  Widget build(BuildContext context) {
    int correctAnswersStage1 = answers.where((answer) {
      return answer.stage == 1 &&
          answerKeys[1]?[answer.question - 1] == answer.answer;
    }).length;

    int correctAnswersStage2 = answers.where((answer) {
      return answer.stage == 2 &&
          answerKeys[2]?[answer.question - 1] == answer.answer;
    }).length;

    int totalStage1 = answers.where((answer) => answer.stage == 1).length;
    int totalStage2 = answers.where((answer) => answer.stage == 2).length;

    double percentageStage1 = (correctAnswersStage1 / totalStage1) * 100;
    double percentageStage2 = (correctAnswersStage2 / totalStage2) * 100;

    bool isComplete = answers.length == 10; // Assuming there are 10 questions

    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Kuiz'),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: Column(
        children: [
          if (isComplete) // Show result only if all stages are complete
            SizedBox(height: 16.0), // Add space from the app bar
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal margin
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16.0), // Make the box rounded
            ),
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Nilai',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                Text(
                  'Stage 1: ${percentageStage1.toStringAsFixed(2)}%',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  'Stage 2: ${percentageStage2.toStringAsFixed(2)}%',
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
                final correctAnswer =
                    answerKeys[answer.stage]?[answer.question - 1];
                final isCorrect = correctAnswer == answer.answer;

                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${answer.question}'),
                  ),
                  title: Text('Stage ${answer.stage}'),
                  subtitle: Text(answer.stage == 1
                      ? 'Pemecahan suku kata'
                      : 'Assesmen berhitung'),
                  trailing: Icon(
                    isCorrect ? Icons.check : Icons.close,
                    color: isCorrect ? Colors.green : Colors.red,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final gemini = Gemini.instance;
          try {
            final result = await gemini.text(
                'Berdasarkan hasil kuis, persentase jawaban benar untuk Stage 1 (disleksia) adalah ${percentageStage1.toStringAsFixed(2)}% dan untuk Stage 2 (diskalkulia) adalah ${percentageStage2.toStringAsFixed(2)}%. Berikan output diagnosis dan saran untuk orang tua yang dapat di lakukan di rumah dalam format JSON dengan struktur {diagnosis:"", saranortu:"", pengertianDisleksia:"", pengertianDiskalkulia:"", caraPenanganan:""} dan jangan ada sepert ```json hanya json saja');

            String formattedResult =
                result?.output ?? 'Tidak ada hasil dari AI';
            formattedResult = formattedResult.replaceAllMapped(
              RegExp(r'\*\*(.*?)\*\*'),
              (match) => '**${match.group(1)}**',
            );

            await _saveResult(formattedResult); // Save result to local disk

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultDetailScreen(
                  result: formattedResult,
                  percentageStage1: percentageStage1,
                  percentageStage2: percentageStage2,
                ),
              ),
            );
          } catch (e) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultDetailScreen(
                  result: 'Terjadi kesalahan: $e',
                  percentageStage1: percentageStage1,
                  percentageStage2: percentageStage2,
                ),
              ),
            );
          }
        },
        child: Icon(Icons.info),
      ),
    );
  }
}

class ResultDetailScreen extends StatelessWidget {
  final String result;
  final double percentageStage1;
  final double percentageStage2;

  ResultDetailScreen({
    required this.result,
    required this.percentageStage1,
    required this.percentageStage2,
  });

  Future<String?> _loadResult() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('quiz_result');
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> jsonResult = {};
    try {
      jsonResult = jsonDecode(result);
    } catch (e) {
      // Handle JSON decode error
    }

    // Calculate inverted percentages
    double invertedPercentageStage1 = 100 - percentageStage1;
    double invertedPercentageStage2 = 100 - percentageStage2;

    return Scaffold(
      appBar: AppBar(
        title: Text('Analisa'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: jsonResult.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hasil Diagnosa',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Disleksia',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '${invertedPercentageStage1.toStringAsFixed(2)}%',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Diskalkulia',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '${invertedPercentageStage2.toStringAsFixed(2)}%',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Pengertian',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Disleksia',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(jsonResult['pengertianDisleksia'] ?? ''),
                  SizedBox(height: 8.0),
                  Text(
                    'Diskalkulia',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(jsonResult['pengertianDiskalkulia'] ?? ''),
                  SizedBox(height: 16.0),
                  Text(
                    'Apa yang harus orang tua lakukan?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(jsonResult['saranortu'] ?? ''),
                  SizedBox(height: 16.0),
                  Text(
                    'Cara Penanganan',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(jsonResult['caraPenanganan'] ?? ''),
                ],
              )
            : Column(
                children: [
                  Text(result),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Text('Kembali ke Home'),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await _loadResult(); // Load result from local disk
          if (result != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultDetailScreen(
                  result: result,
                  percentageStage1: percentageStage1,
                  percentageStage2: percentageStage2,
                ),
              ),
            );
          }
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
