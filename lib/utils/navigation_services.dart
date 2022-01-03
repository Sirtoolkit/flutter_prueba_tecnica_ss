import 'package:flutter/cupertino.dart';

class NavigationServices {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, Object? arguments) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }
}
