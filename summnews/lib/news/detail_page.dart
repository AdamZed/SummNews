import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final article;

  const DetailPage(this.article);

  @override
  Widget build(BuildContext context) {
    final title = article['title'];
    final summary = article['summary'].trim();
    final date = article['date_published'];
    final src = article['source'];
    final img = article['image'];
    return new Scaffold(
        body: new ListView(
          padding: new EdgeInsets.all(16.0),
          children: <Widget>[
            new Container(
              height: 15.0,
            ),
            new Text(
              '$title',
              style: new TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
            ),
            new Text(
              '$src: $date',
              style: new TextStyle(fontSize: 22.5, fontWeight: FontWeight.bold),
            ),
            new Container(
              height: 15.0,
            ),
            new ClipRRect(
                borderRadius: new BorderRadius.circular(10.0),
                child: Image.network(img, fit: BoxFit.cover)),
            new Container(
              height: 15.0,
            ),
            new Text(
              '$summary',
              style: new TextStyle(fontSize: 22.0),
            ),
            new Container(
              height: article["category"] == "disaster" ? 125.0 : 75.0,
            ),
          ],
        ),
        floatingActionButton: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
          new FloatingActionButton(
            elevation: 0.0,
            heroTag: null,
            child: new Icon(Icons.open_in_new),
            backgroundColor: Colors.red,
            tooltip: "View full article",
            onPressed: () async {
              final url = article['url'];
              if (await canLaunch(url)) await launch(url);
            },
          ), new Container(
              height: article["category"] == "disaster"
              ? 10.0
              : 0.0
            ), article["category"] == "disaster"
            ? new FloatingActionButton(
                elevation: 0.0,
                heroTag: null,
                child: new Icon(Icons.favorite),
                backgroundColor: Colors.pink,
                tooltip: "Donate to Red Cross Relief",
                onPressed: () async {
                  final url = "https://www.redcross.org/donate/hurricane-florence-donations.html/";
                  if (await canLaunch(url)) await launch(url);
                },
            )
            : new Container(),
        ]));
  }
}
