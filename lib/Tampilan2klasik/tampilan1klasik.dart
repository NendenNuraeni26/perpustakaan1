import 'package:aplikasiperpustakaan/Tampilan2klasik/api.dart';
import 'package:aplikasiperpustakaan/Tampilan2klasik/book_model.dart';
import 'package:aplikasiperpustakaan/tampilan3/tampilan3klasik.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Tampilan1klasik());
}

class Tampilan1klasik extends StatefulWidget {
  const Tampilan1klasik({Key? key}) : super(key: key);

  @override
  State<Tampilan1klasik> createState() => _Tampilan1klasikState();
}

class _Tampilan1klasikState extends State<Tampilan1klasik> {
  late final API1 _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = API1();
    _bloc.fetchBooks(); // Corrected method call
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Klasik Populer",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 200,
          child: StreamBuilder<List<BookModel1>>(
            stream: _bloc.bookStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No books available'));
              }

              List<int> displayIndices = [3, 6, 9];

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (displayIndices.contains(index) &&
                      index < snapshot.data!.length) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailBuku1(
                              simpleThumb: snapshot.data![index].simpleThumb,
                              title: snapshot.data![index].title,
                              author: snapshot.data![index].author,
                              genre: snapshot.data![index].genre,
                            ),
                          ),
                        );
                      },
                      child: KatalogItem(snapshot.data![index]),
                    );
                  } else {
                    return Container();
                  }
                },
                itemCount: snapshot.data!.length,
              );
            },
          ),
        ),
      ],
    );
  }
}

class KatalogItem extends StatelessWidget {
  final BookModel1 book;

  KatalogItem(this.book);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 160,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 97, 130, 100),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              book.simpleThumb,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(7, 0, 0, 1),
            child: Text(
              book.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
