import 'dart:async';
import 'dart:convert';
import 'package:aplikasiperpustakaan/Tampilan2klasik/book_model.dart';
import 'package:http/http.dart' as http;

class API1 {
  final _bookController = StreamController<List<BookModel1>>.broadcast();

  Stream<List<BookModel1>> get bookStream => _bookController.stream;

  Future<List<BookModel1>> fetchBooks() async {
    try {
      var response = await http
          .get(Uri.parse("https://wolnelektury.pl/api/books/?format=json"));

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        List<BookModel1> books = data.map((bookData) {
          return BookModel1(
            title: bookData['title'],
            author: bookData['author'],
            genre: bookData['genre'],
            simpleThumb: bookData['simple_thumb'],
          );
        }).toList();

        _bookController.add(books);
        return books; // Return the list of books
      } else {
        print("Failed to load data. Status code: ${response.statusCode}");
        throw Exception("Failed to load data");
      }
    } catch (error) {
      print("Error fetching data: $error");
      throw Exception("Error fetching data");
    }
  }

  void dispose() {
    _bookController.close();
  }
}
