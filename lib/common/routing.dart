import 'package:dental_app/screens/camera/camera.dart';
import 'package:dental_app/screens/home/homeScreen.dart';
import 'package:dental_app/screens/login/login_screen.dart';
import 'package:dental_app/screens/login/otp.dart';
import 'package:dental_app/screens/proflie/profile.dart';
import 'package:dental_app/screens/report/reportScreen.dart';
import 'package:flutter/cupertino.dart';

class RouteName {
  static const home = "home";
  static const otp = "otp";
  static const teamScreen = "team";
  static const login = "login";
  static const scanner = "scanner";
  static const profile = "profile";
  static const reportScreeen = "reportScreen";
}

class Routes {
  static cupertinoRoute(
          String name, Widget Function(BuildContext) widgetProvider) =>
      CupertinoPageRoute(
        settings: RouteSettings(name: name),
        builder: (context) => widgetProvider(context),
      );

  static Route home() => cupertinoRoute(RouteName.home, (ctx) => const Home());

  static Route otp() =>
      cupertinoRoute(RouteName.home, (ctx) => const OtpScreen());

  static Route scanner() =>
      cupertinoRoute(RouteName.home, (ctx) => CameraScreen());
  static Route profile() => cupertinoRoute(RouteName.home, (ctx) => Profile());
  static Route reportScreen() =>
      cupertinoRoute(RouteName.home, (ctx) => ReportScreeen());

  static Route login() =>
      cupertinoRoute(RouteName.login, (ctx) => const LoginPage());
}
