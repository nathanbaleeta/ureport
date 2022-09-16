import 'package:flutter/material.dart';
import 'package:ureport_app/Opinions/OpinionsWebview.dart';
import 'package:ureport_app/navigation/UReportAppBar.dart';
import 'package:ureport_app/polls/PollChat.dart';
import 'package:ureport_app/stories/StoryListView.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    OpinionsWebView(),
    StoryListView(),
    PollChat(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.equalizer),
            label: 'Opinions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Stories',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('lib/media/pollboticon.png')),
            label: 'Poll Bot',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _onItemTapped,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          UReportAppBar(),
          SliverFillRemaining(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
    );
  }
}
