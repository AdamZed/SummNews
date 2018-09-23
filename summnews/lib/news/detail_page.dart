import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
          new Container(
            height: 15.0,
          ),
          new Image.network(img, fit: BoxFit.fitWidth, alignment: Alignment.center,),
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
            height: 12.5,
          ),
          new Text(
            '$summary',
            style: new TextStyle(fontSize: 14.0),
          ),
          new Container(
            height: 100.0,
          ),
        ],
      ),
    floatingActionButton: new FloatingActionButton(
      elevation: 0.0,
      child: new Icon(Icons.open_in_new),
      backgroundColor: Colors.red,
      onPressed: () async {
        final url = article['url'];
        if (await canLaunch(url)) await launch(url);
      } ,
      tooltip: "View full article",
    ),
    );
  }

}
