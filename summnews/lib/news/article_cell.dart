import 'package:flutter/material.dart';

class ArticleCell extends StatelessWidget {
  final article;

  ArticleCell(this.article);

  @override
  Widget build(BuildContext context) {
    final title = article['title'];
    final summary = article['summary'];
    final date = article['date_published'];
    final src = article['src'];

    return new GestureDetector(
      onTap: () {
        Navigator.push(context, 
          new MaterialPageRoute(
            builder: (context) => new Text(
              '$title\n$src: $date\n\n$summary',
              style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            )
          )
        );
      },
      child: Column(children: <Widget>[
      new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Image.network(article["image"]),
              new Container(
                height: 8.0,
              ),
              new Text(
                title,
                style:
                    new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              )
            ],
          )
        )
    ]));
  }
}
