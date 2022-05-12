import 'package:flutter/material.dart';

class PageTransition extends PageRouteBuilder<dynamic> {
  PageTransition(
    GlobalKey materialAppKey,
    String routeName,
    Duration duration, {
    Object? arguments,
  }) : super(
          settings: RouteSettings(
            arguments: arguments,
            name: routeName,
          ),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            assert(materialAppKey.currentWidget != null);
            assert(materialAppKey.currentWidget is MaterialApp);

            final materialApp = materialAppKey.currentWidget as MaterialApp;
            final routes = materialApp.routes;

            assert(routes!.containsKey(routeName));

            return routes![routeName]!(context);
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
          transitionDuration: duration,
        );
}
