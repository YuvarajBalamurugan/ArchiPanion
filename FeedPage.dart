import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Feed', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text('Daily Updates Content Here', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
