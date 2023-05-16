import 'package:flutter/material.dart';

class NavigationCustom {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState get currentState {
    return navigatorKey.currentState ?? NavigatorState();
  }
}
