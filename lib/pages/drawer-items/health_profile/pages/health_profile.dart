import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/widgets/dimension.dart';
import '/theme/palette.dart';
import '/auth/login/login.dart';
import '/models/user.dart';
import '/models/user_health_profile_model.dart';
import '/pages/drawer-items/health_profile/pages/edit_blood_pressure.dart';
import '/pages/drawer-items/health_profile/pages/edit_bmi.dart';
import '/pages/drawer-items/health_profile/pages/edit_height.dart';
import '/pages/drawer-items/health_profile/pages/edit_weight.dart';
import '/pages/drawer-items/health_profile/pages/edit_blood_group.dart';
import '/pages/drawer-items/health_profile/pages/edit_sp02.dart';

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

      _checkAuthentication = new Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.mainBlueTheme,
          title: Text(
            'Hồ sơ sức khỏe',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
        ),
        body: new Container(
          color: Colors.white,
          child: new SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 250.0,
                    color: Colors.white,
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 40.0),
                          child: new Stack(
                            fit: StackFit.loose,
                            children: <Widget>[
                              new Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Center(
                                    child: userModel.photoUrl == null ||
                                            userModel.photoUrl.isEmpty
                                        ? CircleAvatar(
                                            radius: 70, // Image radius
                                            backgroundImage: AssetImage(
                                                'assets/icons/user_login.png'),
                                          )
                                        : CircleAvatar(
                                            radius: 70, // Image radius
                                            backgroundImage: NetworkImage(
                                                '${userModel.photoUrl}'),
                                          ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 0,
                ),
                Expanded(
                  child: Container(
                    color: Color(0xffFFFFFF),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 25.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              left: 25.0,
                              right: 25.0,
                            ),
                            child: Text(
                              'Thông tin hồ sơ sức khỏe',
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  flex: 0,
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const EditHeight(),
                            ),
                          ),
                          child: Container(
                            width: Dimensions.boxViewWidth,
                            margin: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color: Palette.mainBlueTheme,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius15),
                              boxShadow: [
                                BoxShadow(
                                  color: Palette.mainBlueTheme,
                                  offset: const Offset(
                                    0.0,
                                    0.0,
                                  ),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ), //BoxShadow
                              ],
                            ),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/health_profile_icon/height.png',
                                          height: 60,
                                          width: 60,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            userHealthProfileModel.height ==
                                                        null ||
                                                    userHealthProfileModel
                                                        .height.isEmpty
                                                ? Text(
                                                    'Không có dữ liêu',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Palette.whiteText,
                                                    ),
                                                  )
                                                : Text(
                                                    '${userHealthProfileModel.height}',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Palette.whiteText,
                                                    ),
                                                  ),
                                            Text(
                                              'cm',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Palette.whiteText,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Chiều cao',
                                      style: TextStyle(
                                        color: Palette.whiteText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const EditWeight(),
                                  ),
                                ),
                                child: Container(
                                  width: Dimensions.boxViewWidth,
                                  margin: EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    color: Palette.mainBlueTheme,
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Palette.mainBlueTheme,
                                        offset: const Offset(
                                          0.0,
                                          0.0,
                                        ),
                                        blurRadius: 10.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                    ],
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: <Widget>[
                                              Image.asset(
                                                'assets/health_profile_icon/weight.png',
                                                height: 40,
                                                width: 50,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(width: 10),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  userHealthProfileModel
                                                                  .weight ==
                                                              null ||
                                                          userHealthProfileModel
                                                              .weight.isEmpty
                                                      ? Text(
                                                          'Không có dữ liêu',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                            color: Palette
                                                                .whiteText,
                                                          ),
                                                        )
                                                      : Text(
                                                          '${userHealthProfileModel.weight}',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20,
                                                              color: Palette
                                                                  .whiteText),
                                                        ),
                                                  Text(
                                                    'kg',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Palette.whiteText,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Cân nặng',
                                            style: TextStyle(
                                              color: Palette.whiteText,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  flex: 0,
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const EditBMI(),
                            ),
                          ),
                          child: Container(
                            width: Dimensions.boxViewWidth,
                            margin: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color: Palette.mainBlueTheme,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius15),
                              boxShadow: [
                                BoxShadow(
                                  color: Palette.mainBlueTheme,
                                  offset: const Offset(
                                    0.0,
                                    0.0,
                                  ),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ), //BoxShadow
                              ],
                            ),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/health_profile_icon/bmi.png',
                                          height: 60,
                                          width: 60,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            userHealthProfileModel.bmi ==
                                                        null ||
                                                    userHealthProfileModel
                                                        .bmi.isEmpty
                                                ? Text(
                                                    'Không có dữ liệu',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Palette.whiteText,
                                                    ),
                                                  )
                                                : Text(
                                                    '${userHealthProfileModel.bmi}',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Palette.whiteText,
                                                    ),
                                                  ),
                                            Text(
                                              'kg/m2',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Palette.whiteText,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Chỉ số BMI',
                                      style: TextStyle(
                                        color: Palette.whiteText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const EditBloodPressure(),
                                  ),
                                ),
                                child: Container(
                                  width: Dimensions.boxViewWidth,
                                  margin: EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    color: Palette.mainBlueTheme,
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Palette.mainBlueTheme,
                                        offset: const Offset(
                                          0.0,
                                          0.0,
                                        ),
                                        blurRadius: 10.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                    ],
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: <Widget>[
                                              Image.asset(
                                                'assets/health_profile_icon/blood_pressure.png',
                                                height: 60,
                                                width: 60,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(width: 10),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  userHealthProfileModel.SBP ==
                                                              null ||
                                                          userHealthProfileModel
                                                                  .DBP ==
                                                              null ||
                                                          userHealthProfileModel
                                                              .SBP.isEmpty ||
                                                          userHealthProfileModel
                                                              .DBP.isEmpty
                                                      ? Text(
                                                          'Không có dữ liêu',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20,
                                                              color: Palette
                                                                  .whiteText),
                                                        )
                                                      : Text(
                                                          '${userHealthProfileModel.SBP}/${userHealthProfileModel.DBP}',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                            color: Palette
                                                                .whiteText,
                                                          ),
                                                        ),
                                                  Text(
                                                    'mmHg',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Palette.whiteText,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Huyết áp',
                                            style: TextStyle(
                                              color: Palette.whiteText,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  flex: 0,
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const EditSP02(),
                            ),
                          ),
                          child: Container(
                            width: Dimensions.boxViewWidth,
                            margin: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color: Palette.mainBlueTheme,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius15),
                              boxShadow: [
                                BoxShadow(
                                  color: Palette.mainBlueTheme,
                                  offset: const Offset(
                                    0.0,
                                    0.0,
                                  ),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ), //BoxShadow
                              ],
                            ),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/health_profile_icon/sp02.png',
                                          height: 60,
                                          width: 60,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            userHealthProfileModel.SP02 ==
                                                        null ||
                                                    userHealthProfileModel
                                                        .SP02.isEmpty
                                                ? Text(
                                                    'Không có dữ liêu',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Palette.whiteText,
                                                    ),
                                                  )
                                                : Text(
                                                    '${userHealthProfileModel.SP02}',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Palette.whiteText,
                                                    ),
                                                  ),
                                            Text(
                                              'nhịp/phút',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Palette.whiteText,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Nhịp tim',
                                      style: TextStyle(
                                        color: Palette.whiteText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const EditBloodGroup(),
                                  ),
                                ),
                                child: Container(
                                  width: Dimensions.boxViewWidth,
                                  margin: EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    color: Palette.mainBlueTheme,
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Palette.mainBlueTheme,
                                        offset: const Offset(
                                          0.0,
                                          0.0,
                                        ),
                                        blurRadius: 10.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                    ],
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: <Widget>[
                                              Image.asset(
                                                'assets/health_profile_icon/blood_group.png',
                                                height: 60,
                                                width: 60,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(width: 10),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  userHealthProfileModel
                                                                  .bloodGroup ==
                                                              null ||
                                                          userHealthProfileModel
                                                              .bloodGroup
                                                              .isEmpty
                                                      ? Text(
                                                          'Không có dữ liêu',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                            color: Palette
                                                                .whiteText,
                                                          ),
                                                        )
                                                      : FittedBox(
                                                          fit: BoxFit.cover,
                                                          child: Text(
                                                            '${userHealthProfileModel.bloodGroup}',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20,
                                                              color: Palette
                                                                  .whiteText,
                                                            ),
                                                          ),
                                                        ),
                                                  Text(
                                                    'mmHg',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Palette.whiteText,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Nhóm máu',
                                            style: TextStyle(
                                              color: Palette.whiteText,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  flex: 0,
                ),
              ],
            ),
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
