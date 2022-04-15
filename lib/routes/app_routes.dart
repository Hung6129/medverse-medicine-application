import 'package:medverse_mobile_app/pages/drawer-items/health_profile/widgets/main_screen_health_profile.dart';
import 'package:medverse_mobile_app/pages/drawer-items/pill_identifier/pages/pill_identifier_screen.dart';

import '../pages/drawer-items/check_interaction/pages/interaction_checker.dart';
import '../pages/drawer-items/compare_drugs/pages/compare_drug_screen.dart';
import '../pages/drawer-items/health_profile/pages/health_profile.dart';
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

      case "/pill-identifier":
        return getMaterialRoute(Identifier());

      case "/compare-drug":
        return getMaterialRoute(CompareDrug());

      case "/interaction-checker":
        return getMaterialRoute(InteractionChecker());

      case "/health-profile":
        return getMaterialRoute(TabHealthProfile());
    }
  }
}
