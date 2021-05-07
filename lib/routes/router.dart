import 'package:clipper/constants/constants.dart';
import 'package:clipper/pages/home/home.dart';
import 'package:clipper/pages/login/login.dart';
import 'package:flutter/material.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constants.login:
        return MaterialPageRoute(
          builder: (_) => Login(),
        );
      case Constants.home:
        return MaterialPageRoute(
          builder: (_) => Homepage(),
        );
    }
  }
}
