import 'package:flutter/material.dart';
//import 'package:ureport_app/stories/StoryDetail.dart';
import 'package:ureport_app/stories/StoryConverter.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Poll',
      style: optionStyle,
    ),
    Text(
      'Index 1: Stories',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var converter = new StoryConverter();

  getStoriesData() async {
    var stories = await converter.getStories();
    return stories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('U-Report'),
        backgroundColor: Colors.grey[50],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.equalizer),
            title: Text('Poll'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Stories'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
