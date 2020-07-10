import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glowchat/constants/route_names.dart';
import 'package:glowchat/services/navigation_service.dart';
import 'package:glowchat/viewmodels/login_view_model.dart';
import 'package:glowchat/widgets/busy_button.dart';
import 'package:glowchat/widgets/input_field.dart';
import 'package:glowchat/widgets/text_link.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.blue[900],
            Colors.blue[800],
            Colors.blue[400]
          ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 60,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(32, 132, 232, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: InputField(
                                    placeholder: 'Email',
                                    controller: emailController,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: InputField(
                                    placeholder: 'Password',
                                    password: true,
                                    controller: passwordController,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          TextLink(
                            'Forgot Password',
                            onPressed: () {
                              model.navigateToForgotPassword();
                            },
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          BusyButton(
                            title: 'Login',
                            busy: model.busy,
                            onPressed: () {
                              model.login(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            },
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Continue with social media  & OTP",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Container(
                                    child: MaterialButton(
                                  onPressed: () {
                                    _navigationService
                                        .navigateTo(HomeViewRoute);
                                  },
                                  color: Color(0xFF3b5998),
                                  textColor: Colors.white,
                                  child: Icon(
                                    FontAwesomeIcons.facebookF,
                                    size: 22,
                                  ),
                                  padding: EdgeInsets.all(16),
                                  shape: CircleBorder(),
                                )),
                              ),
                              // SizedBox(width: 10,),
                              Container(
                                child: Container(
                                    child: MaterialButton(
                                  onPressed: () {
                                    model.googleLogin();
                                  },
                                  color: Color(0xFFEA4335),
                                  textColor: Colors.white,
                                  child: Icon(
                                    FontAwesomeIcons.google,
                                    size: 22,
                                  ),
                                  padding: EdgeInsets.all(16),
                                  shape: CircleBorder(),
                                )),
                              ),
                              Container(
                                child: Container(
                                    child: MaterialButton(
                                  onPressed: () {
                                    model.navigateToPhoneAuth();
                                  },
                                  color: Color(0xFF34A853),
                                  textColor: Colors.white,
                                  child: Icon(
                                    FontAwesomeIcons.mobileAlt,
                                    size: 22,
                                  ),
                                  padding: EdgeInsets.all(16),
                                  shape: CircleBorder(),
                                )),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          TextLink(
                            'Create an Account if you\'re new.',
                            onPressed: () {
                              model.navigateToSignUP();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
