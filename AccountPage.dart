import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'SearchPage.dart';
import 'MyLearningPage.dart';
import 'FeedPage.dart';

class AccountPage extends StatefulWidget {
  final int initialIndex;

  AccountPage({this.initialIndex = 3}); // Default index for AccountPage

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  // Method to handle bottom navigation icon taps
  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

      if (index == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage(initialIndex: index)));
      } else if (index == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SearchPage(initialIndex: index)));
      } else if (index == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyLearningPage(initialIndex: index)));
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
        title: Text('Account Page', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.jpg'), // Placeholder image
            ),
            SizedBox(height: 16),
            Text(
              'Name: John Doe',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Role: Architect', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Email: john.doe@example.com', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Date of Birth: 01/01/1990', style: TextStyle(fontSize: 16)),
          ],
        ),
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
