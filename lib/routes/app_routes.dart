import '/controller/cubit/drugs_data/drugs_data_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/screens/mainscreen.dart';
import '/screens/wellcome_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static MaterialPageRoute getMaterialRoute(screen) {
    return MaterialPageRoute(builder: (context) => screen);
  }

  static PageRouteBuilder getPageRoute(screen) {
    return PageRouteBuilder(
      pageBuilder: (context, _, __) => screen,
      transitionDuration: Duration(
        milliseconds: 300,
      ),
      reverseTransitionDuration: Duration(
        milliseconds: 300,
      ),
    );
  }

  static Route onGeneratedRoutes(RouteSettings route) {
    switch (route.name) {
      case "/":
        return getPageRoute(WellcomeScreen());

      case "/home":
        return getMaterialRoute(TabScreen());
    }
  }
}
