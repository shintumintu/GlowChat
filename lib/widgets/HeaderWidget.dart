import 'package:flutter/material.dart';


AppBar header(context,{bool isAppTitle,bool isIcon,String strTitle, Widget icon,disappearedBackButton=false}){
  return AppBar(
  
    leading: IconButton(onPressed:(){} ,icon: isIcon ?icon : Icon(Icons.photo_camera,color: Colors.white, size: 40.0,),) ,
    
    automaticallyImplyLeading: disappearedBackButton ? false:true,
    title: Text(
      isAppTitle ? "GlowChat" : strTitle,
      style: TextStyle(
        color: Colors.white,
        fontSize: isAppTitle ? 25.0:25.0,
      ),
      overflow: TextOverflow.ellipsis,
    ),
    actions: <Widget>[
      IconButton(icon:isIcon ?icon : Icon(Icons.search,color: Colors.white, size: 40.0,), onPressed: (){ }),
      IconButton(icon:isIcon ?icon : Icon(Icons.send,color: Colors.white, size: 40.0,),onPressed: (){})
    ],
    centerTitle: true,
    backgroundColor: Color(0xff09031D),
  );
}