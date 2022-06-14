import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medverse_mobile_app/utils/app_text_theme.dart';
import '/widgets/dimension.dart';
import '/theme/palette.dart';
import '/auth/login/login.dart';
import '/models/user.dart';
import '/models/user_health_profile_model.dart';
import '/pages/drawer-items/health_profile/widgets/edit_blood_pressure.dart';
import '/pages/drawer-items/health_profile/widgets/edit_bmi.dart';
import '/pages/drawer-items/health_profile/widgets/edit_height.dart';
import '/pages/drawer-items/health_profile/widgets/edit_weight.dart';
import '/pages/drawer-items/health_profile/widgets/edit_blood_group.dart';
import '/pages/drawer-items/health_profile/widgets/edit_sp02.dart';

class HealthProfile extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<HealthProfile>
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
    if (user != null) {
      /// Get all data from users collection
      FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get()
          .then((value) {
        this.userModel = UserModel.fromJson(value.data());
        setState(() {});
      });

      /// Get all data from healthProfile collection
      FirebaseFirestore.instance
          .collection("healthProfile")
          .doc(user.uid)
          .get()
          .then((value) {
        this.userHealthProfileModel =
            UserHealthProfileModel.fromMap(value.data());
        setState(() {});
      });

      /// Check if user is authenticated
      _checkAuthentication = new Scaffold(
        body: SingleChildScrollView(
          // scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /// Height card
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const EditHeight(),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 25.0, left: 25.0, right: 25),
                  width: Dimensions.boxViewWidth,
                  decoration: BoxDecoration(
                    color: Palette.whiteText,
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    boxShadow: [
                      BoxShadow(
                        color: Palette.blueGrey,
                        offset: const Offset(
                          0.0,
                          0.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 3.0,
                      ), //BoxShadow
                    ],
                    border: Border.all(
                      color: Palette.blueGrey,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius20),
                              bottomLeft: Radius.circular(Dimensions.radius20),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/health_profile_icon/height.png',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Chiều cao:',
                              style: MobileTextTheme().blackKLabelStyle,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                userHealthProfileModel.height == null ||
                                        userHealthProfileModel.height.isEmpty
                                    ? Text(
                                        'Không có dữ liệu',
                                        style: MobileTextTheme()
                                            .healthProfileNoDataTextStyle,
                                      )
                                    : Text(
                                        '${userHealthProfileModel.height}',
                                        style: MobileTextTheme()
                                            .healthProfileDataTextFont,
                                      ),
                                SizedBox(width: 5),
                                Text(
                                  'cm',
                                  style: MobileTextTheme()
                                      .healthProfileUnitTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// Weight card
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const EditWeight(),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 25.0, left: 25.0, right: 25),
                  width: Dimensions.boxViewWidth,
                  decoration: BoxDecoration(
                    color: Palette.whiteText,
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    boxShadow: [
                      BoxShadow(
                        color: Palette.blueGrey,
                        offset: const Offset(
                          0.0,
                          0.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 3.0,
                      ), //BoxShadow
                    ],
                    border: Border.all(
                      color: Palette.blueGrey,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius20),
                              bottomLeft: Radius.circular(Dimensions.radius20),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/health_profile_icon/weight.png'),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Cân nặng:',
                              style: MobileTextTheme().blackKLabelStyle,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                userHealthProfileModel.weight == null ||
                                        userHealthProfileModel.weight.isEmpty
                                    ? Text(
                                        'Không có dữ liệu',
                                        style: MobileTextTheme()
                                            .healthProfileNoDataTextStyle,
                                      )
                                    : Text(
                                        '${userHealthProfileModel.weight}',
                                        style: MobileTextTheme()
                                            .healthProfileDataTextFont,
                                      ),
                                SizedBox(width: 5),
                                Text(
                                  'kg',
                                  style: MobileTextTheme()
                                      .healthProfileUnitTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// BMI card
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const EditBMI(),
                  ),
                ),
                child: Container(
                  width: Dimensions.boxViewWidth,
                  margin: EdgeInsets.only(top: 25.0, left: 25.0, right: 25),
                  decoration: BoxDecoration(
                    color: Palette.whiteText,
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    boxShadow: [
                      BoxShadow(
                        color: Palette.blueGrey,
                        offset: const Offset(
                          0.0,
                          0.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 3.0,
                      ), //BoxShadow
                    ],
                    border: Border.all(
                      color: Palette.blueGrey,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius20),
                              bottomLeft: Radius.circular(Dimensions.radius20),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/health_profile_icon/bmi.png'),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Chỉ số BMI:',
                              style: MobileTextTheme().blackKLabelStyle,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                userHealthProfileModel.bmi == null ||
                                        userHealthProfileModel.bmi.isEmpty
                                    ? Text(
                                        'Không có dữ liệu',
                                        style: MobileTextTheme()
                                            .healthProfileNoDataTextStyle,
                                      )
                                    : Text(
                                        '${userHealthProfileModel.bmi}',
                                        style: MobileTextTheme()
                                            .healthProfileDataTextFont,
                                      ),
                                SizedBox(width: 5),
                                Text(
                                  'kg/m2',
                                  style: MobileTextTheme()
                                      .healthProfileUnitTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// Blood pressure card
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const EditBloodPressure(),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 25.0, left: 25.0, right: 25),
                  width: Dimensions.boxViewWidth,
                  decoration: BoxDecoration(
                    color: Palette.whiteText,
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    boxShadow: [
                      BoxShadow(
                        color: Palette.blueGrey,
                        offset: const Offset(
                          0.0,
                          0.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 3.0,
                      ), //BoxShadow
                    ],
                    border: Border.all(
                      color: Palette.blueGrey,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius20),
                              bottomLeft: Radius.circular(Dimensions.radius20),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/health_profile_icon/blood_pressure.png'),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Huyết áp:',
                              style: MobileTextTheme().blackKLabelStyle,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                userHealthProfileModel.SBP == null ||
                                        userHealthProfileModel.DBP == null ||
                                        userHealthProfileModel.SBP.isEmpty ||
                                        userHealthProfileModel.DBP.isEmpty
                                    ? Text(
                                        'Không có dữ liệu',
                                        style: MobileTextTheme()
                                            .healthProfileNoDataTextStyle,
                                      )
                                    : Text(
                                        '${userHealthProfileModel.SBP}/${userHealthProfileModel.DBP}',
                                        style: MobileTextTheme()
                                            .healthProfileDataTextFont,
                                      ),
                                SizedBox(width: 5),
                                Text(
                                  'mmHg',
                                  style: MobileTextTheme()
                                      .healthProfileUnitTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// SP02 card
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const EditSP02(),
                  ),
                ),
                child: Container(
                  width: Dimensions.boxViewWidth,
                  margin: EdgeInsets.only(top: 25.0, left: 25.0, right: 25),
                  decoration: BoxDecoration(
                    color: Palette.whiteText,
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    boxShadow: [
                      BoxShadow(
                        color: Palette.blueGrey,
                        offset: const Offset(
                          0.0,
                          0.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 3.0,
                      ), //BoxShadow
                    ],
                    border: Border.all(
                      color: Palette.blueGrey,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius20),
                              bottomLeft: Radius.circular(Dimensions.radius20),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/health_profile_icon/sp02.png'),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Nhịp tim:',
                              style: MobileTextTheme().blackKLabelStyle,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                userHealthProfileModel.SP02 == null ||
                                        userHealthProfileModel.SP02.isEmpty
                                    ? Text(
                                        'Không có dữ liệu',
                                        style: MobileTextTheme()
                                            .healthProfileNoDataTextStyle,
                                      )
                                    : Text(
                                        '${userHealthProfileModel.SP02}',
                                        style: MobileTextTheme()
                                            .healthProfileDataTextFont,
                                      ),
                                SizedBox(width: 5),
                                Text(
                                  'nhịp/phút',
                                  style: MobileTextTheme()
                                      .healthProfileUnitTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// Blood group card
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const EditBloodGroup(),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 25.0, left: 25.0, right: 25),
                  width: Dimensions.boxViewWidth,
                  decoration: BoxDecoration(
                    color: Palette.whiteText,
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    boxShadow: [
                      BoxShadow(
                        color: Palette.blueGrey,
                        offset: const Offset(
                          0.0,
                          0.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 3.0,
                      ), //BoxShadow
                    ],
                    border: Border.all(
                      color: Palette.blueGrey,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius20),
                              bottomLeft: Radius.circular(Dimensions.radius20),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/health_profile_icon/blood_group.png'),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Nhóm máu:',
                              style: MobileTextTheme().blackKLabelStyle,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                userHealthProfileModel.bloodGroup == null ||
                                        userHealthProfileModel
                                            .bloodGroup.isEmpty
                                    ? Text(
                                        'Không có dữ liệu',
                                        style: MobileTextTheme()
                                            .healthProfileNoDataTextStyle,
                                      )
                                    : Text(
                                        '${userHealthProfileModel.bloodGroup}',
                                        style: MobileTextTheme()
                                            .healthProfileDataTextFont,
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      );
    } else {
      _checkAuthentication = new Scaffold(
        body: Login(),
      );
    }
    return _checkAuthentication;
  }
}
