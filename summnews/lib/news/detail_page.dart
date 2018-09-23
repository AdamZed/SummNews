import 'package:flutter/material.dart';

class DetailPageWidget extends StatefulWidget {
  DetailPageWidget({Key key, this.article}) : super(key: key);
  final article;
  @override
  _DetailWidgetState createState() => _DetailWidgetState(); 
}

class _DetailWidgetState extends State<DetailPageWidget> {

 @override
  initState(){
    super.initState();
    _isVisible = true;
    _hideButtonController = new ScrollController();
    _hideButtonController.addListener((){
      if(_hideButtonController.position.userScrollDirection == ScrollDirection.reverse){
        setState((){
          _isVisible = true;
         print("**** ${_isVisible} up");
        });
      }
      if(_hideButtonController.position.userScrollDirection == ScrollDirection.forward){
        setState((){
          _isVisible = false;
          print("**** ${_isVisible} down");

        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final title = widget.article['title'];
    final summary = widget.article['summary'];
    final date = widget.article['date_published'];
    final src = widget.article['source'];
    final img = widget.article['image'];
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
          ),
          new Container(
            height: 100.0,
          ),
        ],
      ),
    floatingActionButton: new FloatingActionButton(
      elevation: 0.0,
      child: new Icon(Icons.open_in_new),
      backgroundColor: Colors.blue,
      onPressed: (){},
      tooltip: "View full article",
      
    ),
    );
  }
}

