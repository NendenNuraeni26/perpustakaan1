import 'package:aplikasiperpustakaan/Tampilan2Pemrograman.dart/judul.dart';
import 'package:aplikasiperpustakaan/Tampilan2Pemrograman.dart/main.dart';
import 'package:aplikasiperpustakaan/Tampilan2klasik/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Kategori());
}

class Kategori extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kategori Buku'),
          backgroundColor: const Color.fromARGB(255, 97, 130, 100),
        ),
        body: CategoryGrid(),
      ),
    );
  }
}

class CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Color.fromARGB(255, 208, 231, 210),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 15),
          Container(
            height: 550,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 97, 130, 100),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Judul(),
                  SizedBox(height: 20),
                  Text(
                    "Selamat datang di Kategori Buku! Pilihlah kategori yang Anda minati dan temukan berbagai jenis buku yang menarik.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Kami menyediakan 2 kategori yaitu Buku Klasik yang berisi buku-buku kuno dengan kekayaan nilai sejarah, dan Buku Pemrograman untuk pengembangan keahlian teknologi Anda.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      padding: EdgeInsets.all(16.0),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        CategoryCard(
                          title: 'Buku Klasik',
                          color: Color.fromARGB(255, 145, 179, 146),
                          icon: Icons.library_books,
                          navigateTo: MainKlasik(),
                        ),
                        CategoryCard(
                          title: 'Buku Pemrograman',
                          color: Color.fromARGB(255, 119, 157, 122),
                          icon: Icons.code,
                          navigateTo: Mainpemrograman(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  final Widget navigateTo;

  CategoryCard({
    required this.title,
    required this.color,
    required this.icon,
    required this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 5,
      child: InkWell(
        onTap: () {
          // Aksi yang ingin dilakukan ketika item diklik
          print('Kategori: $title');

          // Navigasi ke halaman yang dipilih
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigateTo),
          );
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 50.0,
                color: Colors.white,
              ),
              SizedBox(height: 8.0),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
