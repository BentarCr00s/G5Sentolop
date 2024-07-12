import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'game.dart';
import 'dart:async';
import 'models/answer_model.dart';
import 'result.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences

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
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        bool hasResult = await _hasQuizResult();
                        if (hasResult) {
                          final prefs = await SharedPreferences.getInstance();
                          final result = prefs.getString('quiz_result') ?? '';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultDetailScreen(
                                result: result,
                                percentageStage1: 0, // Placeholder
                                percentageStage2: 0, // Placeholder
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Silahkan selesaikan kuiz terlebih dahulu'),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Hasil',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xE5DAC6),
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
