import 'package:flutter/material.dart';

class ProfilePic extends StatefulWidget {
  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: 86.0,
            margin: EdgeInsets.only(left:5.0),
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: _handleTap,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: _active ?  BoxDecoration(
                    shape:BoxShape.circle,
                    gradient: LinearGradient(colors: [Color(0xff6D0EB5),Color(0xff4059F1)],),
                  ): BoxDecoration(
                    shape:BoxShape.circle,
                    
                  ),
                  child: Container(
                    padding: EdgeInsets.all(3),
                     margin: EdgeInsets.all(3),
                    
                    decoration: BoxDecoration(
                      shape:BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/img/default.png'),
                    ),
                  ),
                ),
              ],
            ),
            )
          ),
            Positioned(
            bottom: 8.0,
            right: 4.0,
            child:_active? 
            Container() :Container(
               width: 20.0,
               height: 20.0,
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 color: Colors.green,
                 border: Border.all(
                   color: Colors.white,
                   width: 1.0,
                 )
               ),
               child: Icon(
                 Icons.add,color: Colors.white,size: 15.0,
               ),
          ),
            )
        ],
      )
      );
  }
}