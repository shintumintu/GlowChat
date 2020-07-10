import 'package:flutter/material.dart';
import 'package:glowchat/widgets/HeaderWidget.dart';
import 'package:glowchat/widgets/internet_connection.dart';
import 'package:glowchat/pages/completeprofile/complete_profile.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: header(context, isAppTitle: true,isIcon: false), preferredSize: Size.fromHeight(47.0)),
      body: ConnectionCheck(child:CompleteProfile()),
    );
  }
}
