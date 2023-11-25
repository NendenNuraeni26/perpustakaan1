import 'package:aplikasiperpustakaan/Tampilan2klasik/api.dart';
import 'package:aplikasiperpustakaan/Tampilan2klasik/book_model.dart';
import 'package:aplikasiperpustakaan/tampilan3/tampilan3klasik.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Tampilan2klasik());
}

class Tampilan2klasik extends StatefulWidget {
  const Tampilan2klasik({Key? key});

  @override
  State<Tampilan2klasik> createState() => _Tampilan2klasikState();
}

class _Tampilan2klasikState extends State<Tampilan2klasik> {
  final API1 api = API1();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 196, 231, 198),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Katalog Buku",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: 630,
            child: FutureBuilder<List<BookModel1>>(
              future: api.fetchBooks(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text('No data available'),
                  );
                } else {
                  return ListView.builder(
                    itemCount:
                        snapshot.data!.length > 10 ? 10 : snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var book = snapshot.data![index];
                      return BukuCard(
                        book: book,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BukuCard extends StatelessWidget {
  final BookModel1 book;

  BukuCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailBuku1(
              title: book.title,
              author: book.author,
              genre: book.genre,
              simpleThumb: book.simpleThumb,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 121, 172, 120),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  book.simpleThumb,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(10, 3, 0, 0)),
                  Text(
                    book.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Penulis: ${book.author}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
