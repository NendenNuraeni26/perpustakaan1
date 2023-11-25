import 'package:flutter/material.dart';

class DetailBuku1 extends StatelessWidget {
  final String title, author, genre, simpleThumb;

  DetailBuku1(
      {required this.title,
      required this.author,
      required this.genre,
      required this.simpleThumb});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 97, 130, 100),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 60, 20, 20),
        height: 630,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
          color: Color.fromARGB(255, 208, 231, 210),
        ),
        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30,
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Text(
                '$title',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 10),
              Image.network(simpleThumb, height: 300, width: 250),
              SizedBox(height: 20),
              Text('Gendre :  $genre',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 17)),
              SizedBox(height: 20),
              Text('Author : $author',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
            ],
          ),
        ),
      ),
    );
  }
}
