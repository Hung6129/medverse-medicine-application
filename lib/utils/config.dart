import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';

class Config {
  static initFirebase() async {
    await Firebase.initializeApp();
  }

  static FirebaseAnalytics firebaseAnalytics = new FirebaseAnalytics.instanceFor(app: Config.initFirebase());
  static FirebaseAnalyticsObserver firebaseAnalyticsObserver = new FirebaseAnalyticsObserver(analytics: firebaseAnalytics);
}