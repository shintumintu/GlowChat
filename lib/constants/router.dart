import 'package:flutter/material.dart';
import 'package:glowchat/pages/Home/home.dart';
import 'package:glowchat/pages/UserUpdates/user_details.dart';
import 'package:glowchat/pages/login/forget_password.dart';
import 'package:glowchat/pages/login/login_screen.dart';
import 'package:glowchat/pages/phone/otp_page.dart';
import 'package:glowchat/pages/phone/phone_auth.dart';
import 'package:glowchat/pages/signup/signup.dart';
import 'package:glowchat/pages/Feed/feed.dart';
import 'package:glowchat/pages/video/video.dart';
import 'package:glowchat/pages/Story/story.dart';
import 'package:glowchat/pages/Notification/notification.dart';
import 'package:glowchat/pages/Profile/profile.dart';
import 'route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginScreen(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignupPage(),
      );
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomePage(),
      );
    case ForgotViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ForgotPage(),
      );
       case PhoneViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: PhoneAuthPage(),
      );   
       case OtpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: OtpPage(),
      );   
      case FeedViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: FeedPage(),
      );   
      case  VideoViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: VideoPage(),
      );   
      case StoryViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow:StoryPage(),
      );   
      case NotificationViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: NotificationPage(),
      );   
      case ProfileViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ProfilePage(),
      );   
       case UserViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: UserPage(),
      );   
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
