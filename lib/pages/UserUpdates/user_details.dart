import 'package:flutter/material.dart';
import 'package:glowchat/viewmodels/user_view_model.dart';
import 'package:stacked/stacked.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => UserViewModel(),
        onModelReady: (model) => model.listenToPosts(),
        builder: (context, model, child) => Scaffold(
              body: Column(
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.all(8.0),
                    child: Text("Name:"+ model.fullname,style: TextStyle(fontSize: 20),),
                    )
                  ],
               ),
        )
        );
  }
}
