import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './views/article_cell.dart';

void main() => runApp(new SummNewsApp());

class SummNewsApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<SummNewsApp> {
  var _isLoading = true;
  var _articles;
  var fails = 0;

  _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    final api = 'https://jsonplaceholder.typicode.com/photos';
    final res = await http.get(api);
    if (res.statusCode == 200) {
        _articles = json.decode(res.body);
        fails = 0;
    } else {
        _articles = null;
        fails++;
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_articles == null) _fetchData();
    return new MaterialApp(
        home: new Scaffold(
      appBar: new AppBar(
        title: new Text("SummNews"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.refresh),
            onPressed: () {
              _fetchData();
            },
          )
        ],
      ),
      body: new Center(
        child: _isLoading
            ? new CircularProgressIndicator()
            : new ListView.builder(
                itemCount: this._articles != null
                    ? (this._articles.length > 15 ? 15 : this._articles.length)
                    : 0,
                itemBuilder: (context, i) {
                  return new FlatButton(
                    child: ArticleCell(this._articles[i]),
                    onPressed: () {},
                  );
                }),
      ),
    ));
  }
}
