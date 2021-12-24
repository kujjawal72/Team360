import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team360/main.dart';

enum ScreenName {
  LOGIN,
  MAIN_PAGE,
  TOUCHBASE_DASHBOARD,
  ONBOARD_RETAILER_TOUCHBASE,
  LEARNING
}

ScreenName toScreen(String type) {
  return ScreenName.values
      .firstWhere((element) => element.toString() == "ScreenName." + type);
}

extension ScreenRouteName on ScreenName {
  String get type {
    switch (this) {
      case ScreenName.LOGIN:
        return "/login";
      case ScreenName.MAIN_PAGE:
        return "/";
      case ScreenName.TOUCHBASE_DASHBOARD:
        return "/touchbase_dashboard";
      case ScreenName.ONBOARD_RETAILER_TOUCHBASE:
        return "/onboard_retailer_touchbase";
      case ScreenName.LEARNING:
        return "/learning";
    }
  }
}

class MainRouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (toScreen(settings.name!)) {
      case ScreenName.LOGIN:
        return _workingPageRoute();
      case ScreenName.MAIN_PAGE:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case ScreenName.TOUCHBASE_DASHBOARD:
        return _workingPageRoute();
      case ScreenName.ONBOARD_RETAILER_TOUCHBASE:
        return _workingPageRoute();
      case ScreenName.LEARNING:
        return _workingPageRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _workingPageRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text("We are currently working on this page"),
        ),
      );
    });
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text("You're in the wrong place :("),
        ),
      );
    });
  }
}
