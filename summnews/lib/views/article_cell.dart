import 'package:flutter/material.dart';

class ArticleCell extends StatelessWidget {
  final article;

  ArticleCell(this.article);

  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Image.network(article["thumbnailUrl"]),
              new Container(
                height: 8.0,
              ),
              new Text(
                article["title"],
                style:
                    new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              )
            ],
          ))
    ]);
  }
}
