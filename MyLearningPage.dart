import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'SearchPage.dart';
import 'AccountPage.dart';
import 'FeedPage.dart';

class MyLearningPage extends StatefulWidget {
  final int initialIndex;

  MyLearningPage({this.initialIndex = 2}); // Default index for MyLearningPage

  @override
  _MyLearningPageState createState() => _MyLearningPageState();
}

class _MyLearningPageState extends State<MyLearningPage> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  // Handle bottom navigation icon taps
  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

      if (index == 0) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(initialIndex: index)));
      } else if (index == 1) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(initialIndex: index)));
      } else if (index == 3) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage(initialIndex: index)));
      } else if (index == 4) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => FeedPage()));
      }
    }
  }

  // Example list of courses with progress
  List<Map<String, dynamic>> courses = [
    {'title': 'Course 1', 'progress': 0.3},
    {'title': 'Course 2', 'progress': 0.5},
    {'title': 'Course 3', 'progress': 0.8},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('My Learning Page', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(courses[index]['title']),
            subtitle: LinearProgressIndicator(
              value: courses[index]['progress'],
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            ),
            trailing: Text('${(courses[index]['progress'] * 100).toStringAsFixed(0)}%'),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'My Learning'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
          BottomNavigationBarItem(icon: Icon(Icons.feed), label: 'Feed'),
        ],
      ),
    );
  }
}
