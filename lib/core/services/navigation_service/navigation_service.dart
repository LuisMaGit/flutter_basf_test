import 'package:flutter/material.dart';

NavigationService getNavigationService() {
  return NavigationService();
}

class NavigationService {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static final NavigationService _singleton = NavigationService._internal();

  factory NavigationService() {
    return _singleton;
  }

  NavigationService._internal();

  Future<dynamic> goTo(
    String routeName, {
    dynamic arguments,
  }) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  void goBack([dynamic arguments]) {
    return navigatorKey.currentState!.pop(arguments);
  }
}
