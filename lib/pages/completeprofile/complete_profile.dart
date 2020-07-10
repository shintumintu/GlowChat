import 'package:flutter/material.dart';
import 'package:glowchat/constants/route_names.dart';
import 'package:glowchat/services/navigation_service.dart';
import 'package:glowchat/widgets/busy_button.dart';

import '../../locator.dart';

class CompleteProfile extends StatefulWidget {
  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 30, right: 30, top: 130, bottom: 160),
      elevation: 14.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: <Widget>[
          Container(
            height: 45,
            color: Colors.grey[350],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome to GlowChat',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Complete your profile',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black38,
            ),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            child: Center(
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/img/default.png'),
              ),
            ),
          ),
          Container(
            width: 350,
            height: 70,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 2),
                      child: Text(
                          '1) Add unique user name so that peoples find you easily'),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 2),
                      child: Text(
                          '2) Choose a photo to represent yourself on GlowChat.'),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 2),
                      child: Text(
                          '3) Tell your followers a little bit about yourself'),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            width: 100,
            child: BusyButton(
                title: 'Edit Profile',
                onPressed: () {
                  _navigationService.navigateTo(UserViewRoute);
                }),
          )
        ],
      ),
    );
  }
}
