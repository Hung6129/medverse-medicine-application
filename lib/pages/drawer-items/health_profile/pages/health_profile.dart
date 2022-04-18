import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/widgets/tabbar_widget.dart';
import '/pages/drawer-items/account_information/pages/account_infomation.dart';
import '/pages/drawer-items/health_profile/widgets/main_screen_health_profile.dart';
import '/auth/login/login.dart';
import '/models/user.dart';
import '/models/user_health_profile_model.dart';

class TabHealthProfile extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<TabHealthProfile>
    with SingleTickerProviderStateMixin {
  /// Check if user is authenticated
  User user = FirebaseAuth.instance.currentUser;

  /// Calling user's model
  UserModel userModel = UserModel();

  /// Calling user's health profile
  UserHealthProfileModel userHealthProfileModel = UserHealthProfileModel();

  final GlobalKey key = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _checkAuthentication;

    /// Check if user is authenticated
    if (user != null) {
      _checkAuthentication = new TabBarWidget(
        title: 'Hồ sơ sức khỏe',
        tabs: [
          Tab(
            icon: Icon(Icons.health_and_safety_sharp),
            text: 'Thông tin chỉ số sức khỏe',
          ),
          Tab(
            icon: Icon(Icons.account_balance_sharp),
            text: 'Thông tin chi tiết',
          ),
        ],
        children: [
          HealthProfile(),
          AccountInformation(),
        ],
      );
    } else {
      _checkAuthentication = new Scaffold(
        body: Login(),
      );
    }
    return _checkAuthentication;
  }
}
