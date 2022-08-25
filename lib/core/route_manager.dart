import 'package:flutter/material.dart';
import 'package:systel_telecom_task/core/strings_manager.dart';
import '../features/auth/presentation/screens/auth_view.dart';
import '../features/home/presentation/screens/home_view.dart';

class Routes {
  static const String authRoute = "/authRoute";
  static const String registerRoute = "/register";
  static const String homeRoute = "/homeRoute";
}

class RouteGenerator {
  Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.authRoute:
        return MaterialPageRoute(
          builder: (_) => const AuthView(),
        );

      case Routes.homeRoute:
        final currentUser = settings.arguments;

        return MaterialPageRoute(
          builder: (_) => HomeView(
            currentUser: currentUser,
          ),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteFound.trim()),
              ),
              body: Center(child: Text(AppStrings.noRouteFound.trim())),
            ));
  }
}
