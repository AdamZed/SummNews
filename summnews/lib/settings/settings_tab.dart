import 'package:flutter/material.dart';

class _SettingsWidgetState extends State<SettingsWidget> {
  String techPreference = "noPref";
  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new Text("Preferred Sources",
          style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
      new Row(children: <Widget>[
        new Text("Tech", style: new TextStyle(fontSize: 18.0)),
      ]),
      new Row(children: <Widget>[
        new Radio(
            value: "noPref",
            activeColor: Colors.red,
            groupValue: techPreference,
            onChanged: (String e) => setPreference),
        new Text("No Preference")
      ]),
      new Row(children: <Widget>[
        new Radio(
            value: "bbc",
            activeColor: Colors.red,
            groupValue: techPreference,
            onChanged: (String e) => setPreference),
        new Text("BBC")
      ])
    ]);
  }

  void setPreference(String e) {
    setState(() {
      techPreference = e;
    });
  }
}

class SettingsWidget extends StatefulWidget {
  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}
