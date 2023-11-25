import 'package:aplikasiperpustakaan/Tampilan1.dart/kategori.dart';
import 'package:aplikasiperpustakaan/Tampilan4/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Navigasi());
}

class Navigasi extends StatefulWidget {
  @override
  _NavigasiState createState() => _NavigasiState();
}

class _NavigasiState extends State<Navigasi> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            Kategori(),
            // Tambahkan widget lain yang ingin ditampilkan di sini
            Profilee(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 97, 130, 100),
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color.fromARGB(255, 208, 231, 210),
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: "Koleksi",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
