import 'package:flutter/material.dart';
import 'models/answer_model.dart'; // Import AnswerModel
import 'main.dart'; // Import halaman utama
import 'package:flutter_gemini/flutter_gemini.dart'; // Import flutter_gemini

class ResultScreen extends StatelessWidget {
  final List<AnswerModel> answers;

  ResultScreen({required this.answers});

  // Kunci jawaban
  final Map<int, List<int>> answerKeys = {
    1: [2, 3, 2, 3, 4], // Stage 1
    2: [1, 2, 2, 2, 2], // Stage 2
  };

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
        backgroundColor: Colors.yellow,
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
                'Berdasarkan hasil kuis, persentase jawaban benar untuk Stage 1 (disleksia) adalah ${percentageStage1.toStringAsFixed(2)}% dan untuk Stage 2 (diskalkulia) adalah ${percentageStage2.toStringAsFixed(2)}%. Berikan diagnosis dan saran untuk orang tua dalam format JSON dengan struktur {diagnosis:"", saranortu:""}');

            String formattedResult =
                result?.output ?? 'Tidak ada hasil dari AI';
            formattedResult = formattedResult.replaceAllMapped(
              RegExp(r'\*\*(.*?)\*\*'),
              (match) => '**${match.group(1)}**',
            );

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Hasil AI'),
                  content: SingleChildScrollView(
                    child: Text(formattedResult),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Tutup'),
                    ),
                  ],
                );
              },
            );
          } catch (e) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text('Terjadi kesalahan: $e'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Tutup'),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: Icon(Icons.info),
      ),
    );
  }
}
