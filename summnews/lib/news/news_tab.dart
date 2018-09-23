import 'package:flutter/material.dart';
import './article_cell.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsWidget extends StatefulWidget {
  final String category;
  NewsWidget({Key key, this.category}): super(key: key);
  @override
  _NewsWidgetState createState() => _NewsWidgetState(); 
}

class _NewsWidgetState extends State<NewsWidget> {
  var maxToLoad = 100;
  var _isLoading = true;
  var _articles;
  var fails = 0;

  _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    final api = 'https://newsumm-70f1d.firebaseio.com/articles/${widget.category}.json';
    final res = await http.get(api);
    if (res.statusCode == 200)
      _articles = json.decode(res.body);
    else _articles = null;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_articles == null) _fetchData();
    return new Center(
      child: _isLoading
          ? new CircularProgressIndicator()
          : new ListView.builder(
              itemCount: this._articles != null
                  ? this._articles.length > maxToLoad ? maxToLoad : this._articles.length
                  : 0,
              itemBuilder: (context, i) {
                return new FlatButton(
                  child: ArticleCell(this._articles[i]),
                  onPressed: () {},
                );
              }),
    );
  }
}