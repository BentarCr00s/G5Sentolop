import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'game.dart';
import 'dart:async';
import 'dart:convert';
import 'models/answer_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:intl/intl.dart';

void main() {
  Gemini.init(apiKey: 'AIzaSyBk5LX2qCVqE69XWuylJtAq9JyyQR6-fTI');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dyslexia App',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        _createRoute(),
      );
    });

    return Scaffold(
      backgroundColor: Colors.blue,
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            _createRoute(),
          );
        },
        child: Center(
          child: Image.asset(
            'assets/logo.png', // Replace with your logo asset
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<AnswerModel> _answers = [];

  Future<bool> _hasQuizResult() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('quiz_result');
  }

  Future<List<Map<String, dynamic>>> _loadResults() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/quiz_results.json');
    if (await file.exists()) {
      final contents = await file.readAsString();
      return List<Map<String, dynamic>>.from(jsonDecode(contents));
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/minilogo.png', // Replace with your minilogo asset
                  width: 100,
                  height: 100,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    'assets/wallpaper.png', // Replace with your wallpaper asset
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs
                            .remove('quiz_result'); // Clear previous result
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GameScreen(answers: _answers),
                          ),
                        );
                      },
                      child: Text(
                        'Mulai',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF7C200),
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final results = await _loadResults();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsListScreen(results: results),
                    ),
                  );
                },
                child: Text(
                  'Daftar Hasil',
                  style: TextStyle(color: Color(0xFFF7C200)),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                        color: Color(0xFFF7C200),
                        width: 2), // Updated stroke/outline color
                  ),
                ),
              ),
              SizedBox(height: 20),
              InfoCard(
                title: 'Apa itu Disleksia?',
                description:
                    'Disleksia adalah gangguan belajar yang mempengaruhi kemampuan individu untuk membaca, menulis, dan mengeja. Gejala disleksia biasanya mencakup kesulitan dalam mengidentifikasi suara huruf dan kata, membaca dengan lancar, dan memahami teks yang dibaca. Anak-anak dengan disleksia mungkin lambat dalam mempelajari kata-kata baru dan mengalami kesulitan dalam mengingat urutan kata atau huruf.\n\nPendekatan terbaik untuk mengatasi disleksia adalah melalui intervensi dini dan program pembelajaran yang khusus dirancang. Terapi fonik, yang melibatkan pengajaran hubungan antara huruf dan suara, adalah metode yang efektif. Guru dan spesialis pendidikan juga dapat menggunakan alat bantu visual, seperti kartu flash dan aplikasi edukasi interaktif, untuk membantu anak-anak memvisualisasikan dan memahami kata-kata.\n\nPenting bagi lingkungan sekolah dan rumah untuk memberikan dukungan yang memadai. Ini termasuk menyediakan waktu tambahan untuk tugas dan ujian, menggunakan teknologi bantuan seperti perangkat lunak pembaca layar, dan memberikan instruksi yang jelas dan konsisten. Membentuk kelompok dukungan untuk orang tua dan anak-anak dengan disleksia juga dapat membantu dalam berbagi pengalaman dan strategi.',
              ),
              InfoCard(
                title: 'Apa itu Diskalkulia?',
                description:
                    'Diskalkulia adalah gangguan belajar yang mempengaruhi kemampuan individu dalam memahami dan bekerja dengan angka serta konsep matematika. Gejalanya termasuk kesulitan dalam menghitung, memahami simbol matematika, mengingat fakta matematika dasar, dan memecahkan masalah matematika yang sederhana. Orang dengan diskalkulia seringkali merasa cemas atau frustrasi ketika dihadapkan pada tugas matematika.\n\nIntervensi pendidikan yang disesuaikan adalah kunci dalam mengatasi diskalkulia. Pengajaran eksplisit dan berulang tentang konsep dasar matematika dapat sangat membantu. Alat bantu visual, seperti diagram, grafik, dan manipulatif fisik (misalnya, blok atau koin) dapat digunakan untuk memperjelas konsep matematika abstrak. Selain itu, penggunaan perangkat lunak pendidikan yang dirancang untuk mengajarkan matematika secara interaktif juga dapat bermanfaat.\n\nLingkungan pendidikan harus dirancang untuk mendukung anak-anak dengan diskalkulia, termasuk pemberian waktu tambahan untuk menyelesaikan tugas, penggunaan kalkulator sebagai alat bantu, dan penilaian berbasis proyek yang memungkinkan siswa menunjukkan pemahaman mereka melalui cara non-tradisional. Penting juga untuk membangun kepercayaan diri siswa melalui pendekatan positif dan memberdayakan mereka dengan strategi coping yang efektif. Dukungan dari keluarga dan guru yang memahami kesulitan ini juga memainkan peran penting dalam keberhasilan individu dengan diskalkulia.',
              ),
              SizedBox(height: 20),
              Text('Made with ♥ by C++nToLoop'),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatefulWidget {
  final String title;
  final String description;

  InfoCard({required this.title, required this.description});

  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleExpand,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Text(
                _isExpanded
                    ? widget.description
                    : '${widget.description.substring(0, 50)}...',
              ),
              if (!_isExpanded)
                Text(
                  'Baca selengkapnya',
                  style: TextStyle(color: Colors.blue),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultsListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> results;

  ResultsListScreen({required this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Hasil'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final result = results[index];
          final DateTime dateTime = DateTime.parse(result['datetime']);
          final String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
          final String formattedTime = DateFormat('HH:mm').format(dateTime); // Format to hour and minute

          // Calculate the total score and divide by 2 to ensure it doesn't exceed 100
          final double totalScore = (result['percentageStage1'] + result['percentageStage2']) / 2;

          return Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formattedDate,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(formattedTime), // Display formatted time
                    ],
                  ),
                ),
                Text(
                  'Nilai : ${totalScore.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.orange),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}