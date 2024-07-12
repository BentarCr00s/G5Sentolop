import 'package:flutter/material.dart';
import 'game.dart';

void main() {
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
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: Image.asset(
            'assets/x.png', // Replace with your logo asset
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dyslexia App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                        backgroundColor:
                            Color(0xE5DAC6), // Ganti warna tombol
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
              Text('Made with ♥ by Nigga'),
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
