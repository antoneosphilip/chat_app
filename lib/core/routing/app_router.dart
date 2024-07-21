import 'package:christy/core/routing/routes.dart';
import 'package:christy/features/home/ui/home_Screen.dart';
import 'package:christy/features/home_bottom_nav/ui/home_bottom_nav.dart';
import 'package:christy/features/login/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../di/dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.homeBottomNav:
        return MaterialPageRoute(
          builder: (_) =>  HomeBottomNav(),
        );


      default:
        return null;
    }
  }
}
