import 'package:medverse_mobile_app/models/drug_bank_db/product_model.dart';
import 'package:medverse_mobile_app/pages/detail_screen/drug_detail.dart';

import '../pages/drawer-items/pill_identifier/pages/pill_identifier.dart';
import '/pages/drawer-items/check_interaction/pages/interaction_checker.dart';
import '/pages/drawer-items/compare_drugs/pages/compare_drug_screen.dart';
import '/pages/drawer-items/health_profile/pages/health_profile.dart';
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
    debugPrint('onGenerateRoute: ${route.name}');
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
      case "/detail-page":
        return getMaterialRoute(
          DrugDetails(
            drugData: route.arguments as ProductModel,
          ),
        );
    }
  }
}
