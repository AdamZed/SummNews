import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final article;

  const DetailPage(this.article);

  @override
  Widget build(BuildContext context) {
    final title = article['title'];
    final summary = article['summary'];
    final date = article['date_published'];
    final src = article['source'];
    final img = article['image'];
    return new Scaffold(
      body: new ListView(
        padding: new EdgeInsets.all(16.0),
        children: <Widget>[
          new Image.network(img),
          new Container(
            height: 10.0,
          ),
          new Text(
            '$title',
            style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          new Text(
            '$src: $date',
            style: new TextStyle(fontSize: 14.0),
          ),
          new Container(
            height: 10.0,
          ),
          new Text(
            '$summary',
            style: new TextStyle(fontSize: 14.0),
          )
        ],
      ),
    );
  }
}
