import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:glowchat/pages/Feed/feed.dart';
import 'package:glowchat/pages/Notification/notification.dart';
import 'package:glowchat/pages/Profile/profile.dart';
import 'package:glowchat/pages/Story/story.dart';
import 'package:glowchat/pages/video/video.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  Widget _showPage = new FeedPage();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return FeedPage();
        break;
      case 1:
        return VideoPage();
        break;
      case 2:
        return StoryPage();
        break;
      case 3:
        return NotificationPage();
        break;
      case 4:
        return ProfilePage();
        break;
    }
    return _pageChooser(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height:40.0,
        items: 
      <Widget>[
      Icon(Icons.home, size: 30,color: Colors.white,),
      Icon(Icons.video_library, size: 30,color: Colors.white,),
      Icon(Icons.add, size: 30,color: Colors.white,),
      Icon(Icons.favorite_border, size: 30,color: Colors.white,),
      Icon(Icons.account_circle, size: 30,color: Colors.white,),
      ],
      color: Color(0xff09031D),
      buttonBackgroundColor:Color(0xff09031D),
      backgroundColor: Colors.white,
      animationCurve: Curves.bounceInOut,
      animationDuration: Duration(milliseconds: 300),
      onTap: (int tappedIndex){
        setState(() {
        _showPage  =_pageChooser(tappedIndex);
        });
      },
      ),
     body: _showPage,    
    );
  }
}
