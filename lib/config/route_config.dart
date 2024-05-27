import 'package:flutter/material.dart';
import 'package:riverpod_sample/features/auth/presentation/screens/login_screen.dart';

import '../features/home/presentation/screen/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  Routes.loginScreen: (context) => LoginScreen(),
  Routes.homeScreen: (context) => const HomeScreen(),
};

class Routes {
  static const String homeScreen = '/homeScreen';
  static const String loginScreen = '/loginScreen';
}