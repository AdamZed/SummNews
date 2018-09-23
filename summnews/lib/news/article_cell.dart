import 'package:flutter/material.dart';
import './detail_page.dart';

class ArticleCell extends StatelessWidget {
  final article;

  ArticleCell(this.article);

  @override
  Widget build(BuildContext context) {

    return new GestureDetector(
      onTap: () {
        Navigator.push(context, 
          new MaterialPageRoute(
            builder: (context) => new DetailPage(article)
          )
        );
      },
      child: Column(children: <Widget>[
      new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new ClipRRect(
                borderRadius: new BorderRadius.circular(10.0),
                child: Image.network(article["image"])
              ),
              new Container(
                height: 10.0,
              ),
              new Text( article["category"] != "disaster"
                ? article["title"]
                : '🔴 ' + article["title"],
                style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              )
            ],
          )
        )
    ]));
  }
}
