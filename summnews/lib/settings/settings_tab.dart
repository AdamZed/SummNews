import 'package:flutter/material.dart';

class _SettingsWidgetState extends State<SettingsWidget> {

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Center(child: Text("Welcome to your settings")),
        new Center(child: Text(":)")),
      ]
    );
  }
}

class SettingsWidget extends StatefulWidget {
  @override
  _SettingsWidgetState createState() => _SettingsWidgetState(); 
}