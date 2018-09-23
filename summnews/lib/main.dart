import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './news/news_tab.dart' as news;
import './settings/settings_tab.dart' as settings;

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(new SummNewsApp()));
}

class SummNewsApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<SummNewsApp> {
  static final categoryKey = GlobalKey<news.NewsWidgetState>();
  var _selectedTab = 0;
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  static String _category = "tech";
  final List<StatefulWidget> _children = [
    news.NewsWidget(category: _category, key: categoryKey),
    settings.SettingsWidget(),
  ];

  VoidCallback _showBottomSheetCB;

  @override
  void initState() {
    super.initState();
    _showBottomSheetCB = _showBottomSheet;
  }

  void _showBottomSheet() {
    setState(() {
      _showBottomSheetCB = null;
    });
    _scaffoldKey.currentState
        .showBottomSheet((context) {
          return new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new ListTile(
                leading: new Icon(Icons.developer_board),
                title: new Text('Tech'),
                onTap: () => setState(() {
                      _category = 'tech';
                      categoryKey.currentState.changeState(_category);
                    }),
              ),
              new ListTile(
                leading: new Icon(Icons.school),
                title: new Text('Science'),
                onTap: () => setState(() {
                      _category = 'science';
                      categoryKey.currentState.changeState(_category);
                    }),
              ),
              new ListTile(
                leading: new Icon(Icons.public),
                title: new Text('World'),
                onTap: () => setState(() {
                      _category = 'world';
                      categoryKey.currentState.changeState(_category);
                    }),
              ),
            ],
          );
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _showBottomSheetCB = _showBottomSheet;
            });
          }
        });
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          key: _scaffoldKey,
          appBar: new AppBar(
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            title: new Text("SummNews | " + _category,
                style: new TextStyle(color: Colors.black87)),
          ),
          body: _children[_selectedTab],
          bottomNavigationBar: new Theme(
              data: Theme.of(context).copyWith(
                  primaryColor: Colors.red,
                  textTheme: Theme.of(context).textTheme),
              child: new BottomAppBar(
                color: Colors.white,
                child: new BottomNavigationBar(
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
              )),
          floatingActionButton: new FloatingActionButton(
              onPressed: _showBottomSheet,
              backgroundColor: Colors.red,
              child: new Icon(Icons.view_headline)),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ));
  }
}
