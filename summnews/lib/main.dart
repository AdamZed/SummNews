import 'package:flutter/material.dart';

import './news/news_tab.dart' as news;
import './settings/settings_tab.dart' as settings;

void main() => runApp(new SummNewsApp());

class SummNewsApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<SummNewsApp> {
  var _selectedTab = 0;
  static String _category = "tech";
  final List<StatefulWidget> _children = [
    new news.NewsWidget(category: _category),
    settings.SettingsWidget(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: new Text(
          "SummNews",
          style: new TextStyle(
            color: Colors.black87
          )
        ),
      ),
      body: _children[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.new_releases),
            title: new Text('News'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          )
        ],
      ),
    ));
  }
}
