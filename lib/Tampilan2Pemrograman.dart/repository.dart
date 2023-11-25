import 'dart:convert';
import 'package:aplikasiperpustakaan/Tampilan2Pemrograman.dart/model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class BookBloc {
  final _bookSubject = BehaviorSubject<List<Book>>.seeded([]);
  Stream<List<Book>> get bookStream => _bookSubject.stream;

  Future<List<Book>> fetchBooks() async {
    var url = 'https://api.itbook.store/1.0/search/mongodb';
    var response = await http.get(Uri.parse(url));
    var bookList = <Book>[];

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      for (var bookData in data['books']) {
        bookList.add(Book.fromJSON(bookData));
      }
    }

    _bookSubject.add(bookList);

    return bookList;
  }

  void dispose() {
    _bookSubject.close();
  }
}
