import 'package:aplikasiperpustakaan/Tampilan1.dart/pencarian.dart';
import 'package:aplikasiperpustakaan/Tampilan2Pemrograman.dart/judul.dart';
import 'package:aplikasiperpustakaan/Tampilan2klasik/tampilan1klasik.dart';
import 'package:aplikasiperpustakaan/Tampilan2klasik/tampilan2klasik.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainKlasik());
}

class MainKlasik extends StatefulWidget {
  const MainKlasik({Key? key});

  @override
  State<MainKlasik> createState() => _MainKlasikState();
}

class _MainKlasikState extends State<MainKlasik> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 97, 130, 100),
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: ListView(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 97, 130, 100),
                ),
                child: Column(
                  children: [Judul(), Pencarian()],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 310,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  children: [Tampilan1klasik()],
                ),
              ),
              SizedBox(height: 20),
              Tampilan2klasik()
            ],
          ),
        ),
      ),
    );
  }
}
