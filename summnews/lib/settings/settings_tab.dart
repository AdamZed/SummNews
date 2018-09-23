import 'package:flutter/material.dart';

class _SettingsWidgetState extends State<SettingsWidget> {
  int techGroup = 1;
  int scienceGroup = 1;
  int worldGroup = 1;
  int enterGroup = 1;

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: new EdgeInsets.all(16.0),
      children: <Widget>[
        new Center(
          child: new Text(
            "Preferred Sources",
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
          )
        ),
        new Text("Tech", style: new TextStyle(fontSize: 18.0)),
        new Row(children: <Widget>[
        new Radio(
            value: 1,
            activeColor: Colors.red,
            groupValue: techGroup,
            onChanged: setTech),
        new Text("No Preference")
      ]),
      new Row(children: <Widget>[
        new Radio(
            value: 2,
            activeColor: Colors.red,
            groupValue: techGroup,
            onChanged: setTech),
        new Text("BBC")
      ]),
      new Row(children: <Widget>[
        new Radio(
            value: 3,
            activeColor: Colors.red,
            groupValue: techGroup,
            onChanged: setTech),
        new Text("Futurism")
      ]),

      new Text("Science", style: new TextStyle(fontSize: 18.0)),
        new Row(children: <Widget>[
        new Radio(
            value: 1,
            activeColor: Colors.red,
            groupValue: scienceGroup,
            onChanged: setScience),
        new Text("No Preference")
      ]),
      new Row(children: <Widget>[
        new Radio(
            value: 2,
            activeColor: Colors.red,
            groupValue: scienceGroup,
            onChanged: setScience),
        new Text("BBC")
      ]),

      new Text("World", style: new TextStyle(fontSize: 18.0)),
        new Row(children: <Widget>[
        new Radio(
            value: 1,
            activeColor: Colors.red,
            groupValue: worldGroup,
            onChanged: setWorld),
        new Text("No Preference")
      ]),
      new Row(children: <Widget>[
        new Radio(
            value: 2,
            activeColor: Colors.red,
            groupValue: worldGroup,
            onChanged: setWorld),
        new Text("BBC")
      ]),

      new Text("Entertainment", style: new TextStyle(fontSize: 18.0)),
        new Row(children: <Widget>[
        new Radio(
            value: 1,
            activeColor: Colors.red,
            groupValue: enterGroup,
            onChanged: setEnter),
        new Text("No Preference")
      ]),
      new Row(children: <Widget>[
        new Radio(
            value: 2,
            activeColor: Colors.red,
            groupValue: enterGroup,
            onChanged: setEnter),
        new Text("BBC")
      ]),
    ]);
  }

  void setTech(int e) {
    setState(() {
      techGroup = e;
    });
  }
  void setScience(int e) {
    setState(() {
      scienceGroup = e;
    });
  }
  void setWorld(int e) {
    setState(() {
      worldGroup = e;
    });
  }
  void setEnter(int e) {
    setState(() {
      enterGroup = e;
    });
  }
}

class SettingsWidget extends StatefulWidget {
  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}
