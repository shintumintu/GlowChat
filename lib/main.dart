import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:glowchat/pages/splashscreen/splash_screen.dart';
import 'package:glowchat/services/dialog_service.dart';
import 'constants/router.dart';
import 'locator.dart';
import 'manager.dart/dialog_manager.dart';
import 'services/navigation_service.dart';

void main() {
  setupLocator();
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GlowChat',
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: new ThemeData(primaryColor: new Color(0xff09031D)),
      home: SplashScreen(),
      onGenerateRoute: generateRoute,
    );
  }
}
