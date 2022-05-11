import 'package:medverse_mobile_app/posts/create_post.dart';
import '/models/drug_bank_db/product_model.dart';
import '/pages/detail_screen/drug_detail.dart';
import '/pages/drawer-items/pill_identifier/pages/pill_identifier_result.dart';
import '../pages/drawer-items/pill_identifier/pages/pill_identifier.dart';
import '/pages/nav-items/feeds/pages/feeds.dart';
import '/pages/drawer-items/pill_identifier/pages/pill_identifier.dart';
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

      //wellconme page
      case "/":
        return getPageRoute(WellcomeScreen());

      /// home page
      case "/home":
        return getMaterialRoute(TabScreen());

      /// detail page
      case "/detail-page":
        return getMaterialRoute(
          DrugDetails(
            drugData: route.arguments as ProductModel,
          ),
        );

      /// pill identifier route
      case "/social":
        return getMaterialRoute(Timeline());

      case "/create-post":
        return getMaterialRoute(CreatePost());

      case "/pill-identifier":
        return getMaterialRoute(PillIdentifier());

      case "/pill-identifier-result":
        return getMaterialRoute(PillIdentifierListResult());

      /// compare route
      case "/compare-drug":
        return getMaterialRoute(CompareDrug());

      /// interaction checker route
      case "/interaction-checker":
        return getMaterialRoute(InteractionChecker());

      /// health profile
      case "/health-profile":
        return getMaterialRoute(TabHealthProfile());
    }
  }
}
