import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basf_test/core/services/navigation_service/routes.dart';
import 'package:flutter_basf_test/views/trivial/trivial_view.dart';

Route _cupertino(Widget route, RouteSettings settings) {
  return CupertinoPageRoute(settings: settings, builder: (_) => route);
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.trivial:
      return _cupertino(TrivialView(), settings);
    default:
      return _cupertino(_NotDefinedRoute(settings.name ?? ''), settings);
  }
}

class _NotDefinedRoute extends StatelessWidget {
  const _NotDefinedRoute(this.route);

  final String route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'No route defined for $route',
        ),
      ),
    );
  }
}