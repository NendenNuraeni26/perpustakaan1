import 'package:aplikasiperpustakaan/Tampilan1.dart/pencarian.dart';
import 'package:aplikasiperpustakaan/Tampilan2Pemrograman.dart/judul.dart';
import 'package:aplikasiperpustakaan/Tampilan2Pemrograman.dart/tampilan1.dart';
import 'package:aplikasiperpustakaan/Tampilan2Pemrograman.dart/tampilan2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Mainpemrograman());
}

class Mainpemrograman extends StatefulWidget {
  const Mainpemrograman({Key? key});

  @override
  State<Mainpemrograman> createState() => _MainpemrogramanState();
}

class _MainpemrogramanState extends State<Mainpemrograman> {
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
                  children: [Tampilan1()],
                ),
              ),
              SizedBox(height: 20),
              Tampilan2()
            ],
          ),
        ),
      ),
    );
  }
}
