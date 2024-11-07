import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'MyLearningPage.dart';
import 'AccountPage.dart';
import 'FeedPage.dart';

class SearchPage extends StatefulWidget {
  final int initialIndex;

  SearchPage({this.initialIndex = 1});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late int _selectedIndex;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  // Handle bottom navigation item taps
  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

      // Navigate to the respective page based on the selected index
      if (index == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage(initialIndex: index)));
      } else if (index == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyLearningPage(initialIndex: index)));
      } else if (index == 3) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AccountPage(initialIndex: index)));
      } else if (index == 4) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FeedPage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search for tools...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Tool ${index + 1}'),
            subtitle: Text('Description for tool ${index + 1}'),
            onTap: () {
              // Implement tool-specific actions here
            },
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
