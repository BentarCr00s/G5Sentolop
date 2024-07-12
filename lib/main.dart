import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'game.dart';
import 'dart:async';

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
                  borderRadius: BorderRadius.circular(
                      20.0), // Adjust the radius as needed
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
                // Tambahkan Row untuk menempatkan tombol secara horizontal
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GameScreen()),
                        );
                      },
                      child: Text(
                        'Mulai',
                        style: TextStyle(color: Colors.white), // Warna teks
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(0xFFF7C200), // Ganti warna tombol
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Border radius
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Tambahkan jarak antara tombol
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to result list
                      },
                      child: Text(
                        'Daftar hasil',
                        style: TextStyle(color: Colors.white), // Warna teks
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xE5DAC6), // Ganti warna tombol
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Border radius
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
                    'Disleksia adalah kesulitan dalam cara otak memproses bahasa tertulis dan lisan. Ini sebagian besar mempengaruhi kemampuan membaca dan dapat diseb...',
              ),
              InfoCard(
                title: 'Apa itu Disgrafia?',
                description:
                    'Disgrafia adalah kesulitan dalam cara otak memproses bahasa tertulis dan lisan. Ini sebagian besar mempengaruhi kemampuan membaca dan dapat diseb...',
              ),
              InfoCard(
                title: 'Apa itu Diskalkulia?',
                description:
                    'Diskalkulia adalah kesulitan dalam cara otak memproses bahasa tertulis dan lisan. Ini sebagian besar mempengaruhi kemampuan membaca dan dapat diseb...',
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

class InfoCard extends StatelessWidget {
  final String title;
  final String description;

  InfoCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(description),
          ],
        ),
      ),
    );
  }
}
