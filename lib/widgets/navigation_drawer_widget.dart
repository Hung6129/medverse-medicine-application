import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medverse_mobile_app/pages/drawer-items/account_information/pages/account_infomation.dart';
import '/utils/firebase.dart';
import '/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '/theme/palette.dart';
import '/auth/login/login.dart';
import '/pages/profile.dart';
import '/pages/drawer-items/pill_identifier/pages/pill_identifier_screen.dart';
import '/pages/drawer-items/capture_images/pages/image_capture_page.dart';
import '/pages/drawer-items/bmi_calculator/pages/input_screen.dart';
import '/pages/drawer-items/check_interaction/pages/interaction_checker.dart';
import '/pages/drawer-items/compare_drugs/pages/compare_drug_screen.dart';
import '/pages/drawer-items/medicine_dictionary/pages/medicine_dictionary.dart';
import '/pages/drawer-items/health_profile/pages/health_profile.dart';
import '/pages/drawer-items/drug_recommendation/pages/drug_recommedation.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key key}) : super(key: key);

  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  /// Check if user is authenticated
  User user = FirebaseAuth.instance.currentUser;

  /// Calling user's model
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
  }

  final padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    Widget checkAuthentication;

    /// Check user is authenticated
    if (user != null) {
      FirebaseFirestore.instance.collection("users").doc(user.uid).get().then(
        (value) {
          this.loggedInUser = UserModel.fromJson(value.data());
          setState(() {});
        },
      );
      checkAuthentication = new Container(
        width: 300,
        child: Drawer(
          child: Material(
            color: Palette.mainBlueTheme,
            child: ListView(
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Profile(
                                    profileId: firebaseAuth.currentUser.uid),
                              ),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(top: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: loggedInUser.photoUrl == null ||
                                      loggedInUser.photoUrl.isEmpty
                                  ? CircleAvatar(
                                      radius: 22, // Image radius
                                      backgroundImage: AssetImage(
                                          'assets/icons/user_login.png'),
                                    )
                                  : CircleAvatar(
                                      radius: 22, // Image radius
                                      backgroundImage: NetworkImage(
                                          '${loggedInUser.photoUrl}'),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          padding: padding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${loggedInUser.username}",
                                style: TextStyle(
                                  color: Palette.p1,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                "${loggedInUser.email}",
                                style: TextStyle(
                                  color: Palette.p1,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: padding,
                  child: Column(
                    children: [
                      buildMenuItem(
                        text: 'Tìm kiếm nâng cao',
                        icon: Icons.zoom_in,
                        onClicked: () => selectedItem(context, 1),
                      ),
                      buildMenuItem(
                        text: 'Báo cáo thuốc đến Admin',
                        icon: Icons.photo_camera_outlined,
                        onClicked: () => selectedItem(context, 2),
                      ),
                      buildMenuItem(
                        text: 'Tính chỉ số BMI',
                        icon: Icons.calculate_outlined,
                        onClicked: () => selectedItem(context, 3),
                      ),
                      buildMenuItem(
                        text: 'Kiểm tra tương kị thuốc',
                        icon: Icons.do_disturb_alt_outlined,
                        onClicked: () => selectedItem(context, 4),
                      ),
                      buildMenuItem(
                        text: 'So sánh thuốc',
                        icon: Icons.compare_outlined,
                        onClicked: () => selectedItem(context, 5),
                      ),
                      buildMenuItem(
                        text: 'Gợi ý thuốc',
                        icon: Icons.recommend_outlined,
                        onClicked: () => selectedItem(context, 6),
                      ),
                      buildMenuItem(
                        text: 'Từ điển y học',
                        icon: Icons.health_and_safety_outlined,
                        onClicked: () => selectedItem(context, 7),
                      ),
                      buildMenuItem(
                        text: 'Hồ sơ sức khỏe',
                        icon: Icons.list_alt_outlined,
                        onClicked: () => selectedItem(context, 8),
                      ),
                      Divider(color: Colors.white70),
                      buildMenuItem(
                        text: 'Đăng xuất',
                        icon: Icons.logout_outlined,
                        onClicked: () {
                          logout(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      checkAuthentication = new Container(
        width: 300,
        child: Drawer(
          child: Material(
            color: Palette.mainBlueTheme,
            child: ListView(
              children: <Widget>[
                Container(
                  padding: padding,
                  child: Column(
                    children: [
                      buildMenuItem(
                        text: 'Tìm kiếm nâng cao',
                        icon: Icons.zoom_in,
                        onClicked: () => selectedItem(context, 1),
                      ),
                      buildMenuItem(
                        text: 'Báo cáo thuốc đến Admin',
                        icon: Icons.photo_camera_outlined,
                        onClicked: () => selectedItem(context, 2),
                      ),
                      buildMenuItem(
                        text: 'Tính chỉ số BMI',
                        icon: Icons.calculate_outlined,
                        onClicked: () => selectedItem(context, 3),
                      ),
                      buildMenuItem(
                        text: 'Kiểm tra tương kị thuốc',
                        icon: Icons.do_disturb_alt_outlined,
                        onClicked: () => selectedItem(context, 4),
                      ),
                      buildMenuItem(
                        text: 'So sánh thuốc',
                        icon: Icons.compare_outlined,
                        onClicked: () => selectedItem(context, 5),
                      ),
                      buildMenuItem(
                        text: 'Gợi ý thuốc',
                        icon: Icons.recommend_outlined,
                        onClicked: () => selectedItem(context, 6),
                      ),
                      buildMenuItem(
                        text: 'Từ điển y học',
                        icon: Icons.health_and_safety_outlined,
                        onClicked: () => selectedItem(context, 7),
                      ),
                      buildMenuItem(
                        text: 'Hồ sơ sức khỏe',
                        icon: Icons.list_alt_outlined,
                        onClicked: () => selectedItem(context, 8),
                      ),
                      Divider(color: Colors.white70),
                      buildMenuItem(
                        text: 'Đăng nhập',
                        icon: Icons.login_outlined,
                        onClicked: () => selectedItem(context, 9),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Container(
      child: checkAuthentication,
    );
  }

  Widget buildHeader({
    String urlImage,
    String name,
    String email,
    VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Fluttertoast.showToast(msg: "Đã thoát tài khoản");
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Identifier(),
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CaptureimagePage(),
          ),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => InputCalculateBMI(),
          ),
        );
        break;
      case 4:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => InteractionChecker(),
          ),
        );
        break;
      case 5:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CompareDrug(),
          ),
        );
        break;
      case 6:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AccountInformation(),
          ),
        );
        break;
      case 7:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MedicineDictionary(),
          ),
        );
        break;
      case 8:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HealthProfile(),
          ),
        );
        break;
      case 9:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
        break;
    }
  }
}
