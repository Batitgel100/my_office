import 'package:flutter/material.dart';
import 'package:my_office/feature/screens/login/loginpage.dart';
import 'package:my_office/feature/screens/owner/main_screen_owner.dart';
import 'package:my_office/feature/screens/renter/main_screen.dart';
import 'package:my_office/feature/screens/my_rooms/my_room_screen.dart';
import 'package:my_office/feature/screens/renter/user/user_screen.dart';
import 'package:my_office/feature/screens/intro/splash.dart';

import '../screens/intro/intro_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      case RoutesName.intro:
        return MaterialPageRoute(
            builder: (BuildContext context) => const IntroScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginPage());
      case RoutesName.myRoom:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MyRoomScreen());

      case RoutesName.mainOwner:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MainScreenOwner());

      case RoutesName.main:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MainScreen());

      case RoutesName.user:
        return MaterialPageRoute(
            builder: (BuildContext context) => const UserScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}

class RoutesName {
  static const String splash = 'splash_view';
  static const String login = 'login';
  static const String intro = 'intro_sceen';
  //accounts routes name
  static const String myRoom = 'my_room';
  static const String mainOwner = 'main_screen_owner';

  //home screen routes name
  static const String main = 'main_screen';
  static const String user = 'user';
}
