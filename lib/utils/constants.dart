import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  /// DrugDB URL
  static const String PRODUCTNAME_TYPE_AHEAD =
      "http://192.168.1.14:8081/api/products/name?name=";
  // Top10 popular drug
  static const String PRODUCT_POPULAR_TOP_10 =
      "http://192.168.1.14:8081/api/products/name?name=hung";
  // Top10 recommended drug
  // static const String PRODUCT_RECOMMENDED_TOP_10 =
  //     "http://192.168.1.4:8080/products/name?name=para";

  // Pill identifier
  static const String PILL_IDENTIFIER_SIZE =
      "http://192.168.1.120:8080/pills/size?sz=";

  /// Colors for theme
  static Color lightPrimary = Color(0xfff3f4f9);
  static Color darkPrimary = Color(0xff2B2B2B);
  static Color lightAccent = Color(0xFF0D47A1);
  static Color darkAccent = Color(0xFF0D47A1);
  static Color lightBG = Color(0xfff3f4f9);
  static Color darkBG = Color(0xff2B2B2B);
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Lato-Regular',
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: lightAccent,
    ),
    scaffoldBackgroundColor: lightBG,
    bottomAppBarTheme: BottomAppBarTheme(
      elevation: 0,
      color: lightBG,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: 'Lato-Regular',
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Lato-Regular',
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: darkAccent,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      elevation: 0,
      color: darkBG,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: lightBG,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: 'Lato-Regular',
        ),
      ),
    ),
  );

  static List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  /// Assets path configuration
  static const appLogo = 'assets/grid_view_images/app-logo.png';
  static const toggleDay = 'assets/grid_view_images/toggle-day.png';
  static const search = 'assets/grid_view_images/search.png';
  static const hamburgerMenu = 'assets/grid_view_images/hamburger-menu.png';

  static const iconDart = 'assets/grid_view_images/icon-dart.svg';
  static const iconFirebase = 'assets/grid_view_images/icon-firebase.svg';
  static const iconFlutter = 'assets/grid_view_images/icon-flutter.svg';

  static const tutorial1 = 'assets/grid_view_images/how-to-parse-json.webp';
  static const tutorial2 = 'assets/grid_view_images/side-effects.webp';
  static const tutorial3 = 'assets/grid_view_images/split-view.webp';
  static const tutorial4 = 'assets/grid_view_images/learn-flutter-animations.webp';

  static const dartCourse = 'assets/grid_view_images/dart-course-banner-small.webp';
  static const flutterAnimationsCourse =
      'assets/grid_view_images/flutter-animations-course-banner-small.webp';
  static const flutterFirebaseCourse =
      'assets/grid_view_images/flutter-firebase-course-banner-small.webp';
  static const flutterRestApiCourse =
      'assets/grid_view_images/flutter-rest-api-course-banner-small.webp';

  static const iconStar = 'assets/grid_view_images/icon-star.svg';
  static const andreaAvatar = 'assets/grid_view_images/andrea-avatar.webp';

}

class ThemeNotifier extends ChangeNotifier {
  final String key = 'theme';
  SharedPreferences _prefs;
  bool _darkTheme;
  bool get dark => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadfromPrefs();
  }
  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  _loadfromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, _darkTheme);
  }
}
