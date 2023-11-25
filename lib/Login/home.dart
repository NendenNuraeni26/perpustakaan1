import 'package:aplikasiperpustakaan/Tampilan1.dart/navigasi.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            image: AssetImage("assets/Gambar.png"),
          ),
          Positioned(
            top: 120,
            left: 70,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Navigasi()));
              },
              child: Container(
                width: 200,
                height: 45,
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 116, 164, 115),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Positioned(
            top: 180,
            left: 53,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Navigasi()));
              },
              child: Container(
                width: 240,
                height: 45,
                child: Center(
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 116, 164, 115),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
