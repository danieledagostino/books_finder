import 'package:bookfinder/book.dart';
import 'package:bookfinder/book_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:bookfinder/book_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LibriScreen(),
    );
  }
}

class LibriScreen extends StatefulWidget {
  @override
  _LibriScreenState createState() => _LibriScreenState();
}

class _LibriScreenState extends State<LibriScreen> {
  Icon icon = Icon(Icons.search);
  Widget widgetSearch = Text('Libri');
  String risultato = '';
  List<Book> books = List<Book>();

/*
  @override
  void initState() {
    cercaLibri('Aurora');
    super.initState();
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: widgetSearch,
          actions: [
            IconButton(
              icon: icon,
              onPressed: () {
                setState(() {
                  if (this.icon.icon == Icons.search) {
                    this.icon = Icon(Icons.cancel);
                    this.widgetSearch = TextField(
                      textInputAction: TextInputAction.search,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      onSubmitted: (t) => cercaLibri(t),
                    );
                  } else {
                    setState(() {
                      this.icon = Icon(Icons.search);
                      this.widgetSearch = Text('Libri');
                    });
                  }
                });
              },
            )
          ],
        ),
        body: ListView.builder(
          itemCount: books.length,
          itemBuilder: ((BuildContext ctx, int pos) {
            return Card(
              elevation: 2,
              child: ListTile(
                  onTap: () {
                    MaterialPageRoute route = MaterialPageRoute(
                        builder: (_) => BookDetail(books[pos]));
                    Navigator.push(context, route);
                  },
                  leading: Image.network(books[pos].urlImage),
                  title: Text(books[pos].title),
                  subtitle: Text(books[pos].authors)),
            );
          }),
        ));
  }

  Future cercaLibri(String text) async {
    final String url = 'https://www.googleapis.com/books/v1/volumes?q=' + text;

    try {
      http.get(url).then((res) {
        final restJson = json.decode(res.body);
        final bookMap = restJson['items'];
        books = bookMap.map<Book>((m) => Book.fromMap(m)).toList();
        setState(() {
          risultato = res.body;
        });
      });
    } catch (err) {
      setState(() {
        risultato = '';
      });
    }

    setState(() {
      risultato = 'Caricando i dati';
    });
  }
}
