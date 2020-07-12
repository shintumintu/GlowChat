import 'package:flutter/material.dart';
class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blue[900],
              Colors.blue[800],
              Colors.blue[400]
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("User Profile", style: TextStyle(color: Colors.white, fontSize: 40),),
                  SizedBox(height: 10,),
                   Text("Details Update", style: TextStyle(color: Colors.white, fontSize: 18),)
                ],
              ),
            ),
            
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 1.0,),
                         Container(
                         child: Column(
                           children: <Widget>[
                             CircleAvatar(
                               radius:45.0,
                               backgroundColor: Colors.grey,
                               child: Icon(Icons.person,color: Colors.white,size: 55.0,),
                             ),
                             Padding(padding: EdgeInsets.all(5),
                             child: Column(
                               children: <Widget>[createNameTextFormField(),createUserNameTextFormField(), createDateofbirthTextFormField(),createWebsiteNameTextFormField(),createBioTextFormField(),createEmailTextFormField(),createPhoneTextFormField()],),
                             )
                           ],
                         ),

                        ),
                        SizedBox(height: 40,),
                      
                        RaisedButton(onPressed: (){},
                        child: Text("Update Profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        color: Colors.blue[900],
                        shape: RoundedRectangleBorder(
                          borderRadius:BorderRadius.circular(20.0)
                        ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
   Column createNameTextFormField(){
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top:13.0),
      child: Text("Name",style: TextStyle(color:Colors.black)), 
      ),
      TextField(
        decoration: InputDecoration(
          hintText: "Write your name here...",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:Colors.grey)
          ),
          hintStyle: TextStyle(color:Colors.grey),
          errorText: null,
        ),
      )
    ],
    );
  }
  Column createUserNameTextFormField(){
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top:13.0),
      child: Text("User Name",style: TextStyle(color:Colors.black)), 
      ),
      TextField(
        decoration: InputDecoration(
          hintText: "Write a user name here...",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:Colors.grey)
          ),
          hintStyle: TextStyle(color:Colors.grey),
          errorText: null
        ),
      )
    ],
    );
  }
   Column createDateofbirthTextFormField(){
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top:13.0),
      child: Text("Date Of Birth",style: TextStyle(color:Colors.black)), 
      ),
      TextField(
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
          hintText: "date of birth",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:Colors.grey)
          ),
          hintStyle: TextStyle(color:Colors.grey),
          errorText: null
        ),
      )
    ],
    );
  }
   Column createWebsiteNameTextFormField(){
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top:13.0),
      child: Text("Websit",style: TextStyle(color:Colors.black)), 
      ),
      TextField(
        decoration: InputDecoration(
          hintText: "Webiste Link",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:Colors.grey)
          ),
          hintStyle: TextStyle(color:Colors.grey),
          errorText: null
        ),
      )
    ],
    );
  }
  Column createBioTextFormField(){
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top:13.0),
      child: Text("Bio",style: TextStyle(color:Colors.black)), 
      ),
      TextField(
        decoration: InputDecoration(
          hintText: "About you",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:Colors.grey)
          ),
          hintStyle: TextStyle(color:Colors.grey),
          errorText: null
        ),
      )
    ],
    );
  }
Column createEmailTextFormField(){
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top:13.0),
      child: Text("Email address",style: TextStyle(color:Colors.black)), 
      ),
      TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: "Email address",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:Colors.grey)
          ),
          hintStyle: TextStyle(color:Colors.grey),
          errorText: null
        ),
      )
    ],
    );
  } 
  Column createPhoneTextFormField(){
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top:13.0),
      child: Text("Phone",style: TextStyle(color:Colors.black),),    
      ),
      TextField(
        keyboardType: null,
        onTap: (){},
        decoration: InputDecoration(
          hintText: "Phone Number",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:Colors.grey)
          ),
          hintStyle: TextStyle(color:Colors.grey),
          errorText: null
        ),
      )
    ],
    );
  } 
}