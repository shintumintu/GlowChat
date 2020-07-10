import 'package:flutter/material.dart';
import 'package:glowchat/widgets/internet_connection.dart';
import 'package:glowchat/widgets/profile_pic.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text('GlowChat'),),
      body: ConnectionCheck(child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
           Row(
             mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
             Padding(
               padding: const EdgeInsets.only(left:20,top:7),
           child:ProfilePic()
             ),
      
         ],
         )],
      )
      )
    );
  }
}