import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'book.dart';

class BookDetail extends StatelessWidget {
  final Book book;

  BookDetail(this.book);

  @override
  Widget build(BuildContext context) {
    var padding2 =
        Padding(padding: EdgeInsets.all(8), child: Text(book.descritpion));
    return Scaffold(
        appBar: AppBar(
          title: Text(book.title),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Image.network(book.urlImage)),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Scritto da ' + book.authors,
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.primary),
                    )),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Editore ' + book.editor,
                      style: TextStyle(fontSize: 16),
                    )),
                Padding(
                    padding: EdgeInsets.all(8), child: Text(book.descritpion)),
              ],
            ),
          ),
        ));
  }
}
