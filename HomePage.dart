import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'SearchPage.dart';
import 'MyLearningPage.dart';
import 'AccountPage.dart';
import 'FeedPage.dart';

class HomePage extends StatefulWidget {
  final int initialIndex;

  HomePage({this.initialIndex = 0});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

      if (index == 1) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(initialIndex: index)));
      } else if (index == 2) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyLearningPage(initialIndex: index)));
      } else if (index == 3) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage(initialIndex: index)));
      } else if (index == 4) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => FeedPage()));
      }
    }
  }

  Widget _buildHorizontalVideoList(List<String> videoPaths) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: videoPaths.length,
        itemBuilder: (context, index) {
          VideoPlayerController _controller = VideoPlayerController.asset(videoPaths[index])
            ..initialize().then((_) {
              setState(() {});
            });
          
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> adVideos = ['assets/videos/course.mp4', 'assets/course/ad2.mp4'];
    List<String> recommendedCourses = ['assets/videos/course.mp4', 'assets/videos/course.mp4'];
    List<String> watchedListCourses = ['assets/videos/course.mp4', 'assets/videos/course.mp4'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Home Page', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Architect Design Courses', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            _buildHorizontalVideoList(adVideos),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Recommended Courses', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            _buildHorizontalVideoList(recommendedCourses),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Watched List', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            _buildHorizontalVideoList(watchedListCourses),
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
