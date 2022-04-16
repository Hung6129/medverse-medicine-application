import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/widgets/constants.dart';
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
        body: new Container(
          child: new SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                /// Height card
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EditHeight(),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(25.0),
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
                                bottomLeft:
                                Radius.circular(Dimensions.radius20),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Chiều cao:',
                                style: black_kLabelStyle,
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  userHealthProfileModel.height == null ||
                                      userHealthProfileModel.height.isEmpty
                                      ? Text(
                                    'Không có dữ liệu',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Palette.textNo,
                                    ),
                                  )
                                      : Text(
                                    '${userHealthProfileModel.height}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.textNo,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'cm',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Palette.textNo,
                                    ),
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
                                bottomLeft:
                                Radius.circular(Dimensions.radius20),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Cân nặng:',
                                style: black_kLabelStyle,
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  userHealthProfileModel.weight == null ||
                                      userHealthProfileModel.weight.isEmpty
                                      ? Text(
                                    'Không có dữ liệu',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Palette.textNo,
                                    ),
                                  )
                                      : Text(
                                    '${userHealthProfileModel.weight}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.textNo,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'kg',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Palette.textNo,
                                    ),
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
                SizedBox(height: 25),

                /// BMI card
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EditBMI(),
                    ),
                  ),
                  child: Container(
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
                                bottomLeft:
                                Radius.circular(Dimensions.radius20),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Chỉ số BMI:',
                                style: black_kLabelStyle,
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  userHealthProfileModel.bmi == null ||
                                      userHealthProfileModel.bmi.isEmpty
                                      ? Text(
                                    'Không có dữ liệu',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Palette.textNo,
                                    ),
                                  )
                                      : Text(
                                    '${userHealthProfileModel.bmi}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.textNo,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'kg/m2',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Palette.textNo,
                                    ),
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
                SizedBox(height: 25),

                /// Blood pressure card
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EditBloodPressure(),
                    ),
                  ),
                  child: Container(
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
                                bottomLeft:
                                Radius.circular(Dimensions.radius20),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Huyết áp:',
                                style: black_kLabelStyle,
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
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Palette.textNo,
                                    ),
                                  )
                                      : Text(
                                    '${userHealthProfileModel.SBP}/${userHealthProfileModel.DBP}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Palette.textNo,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'mmHg',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Palette.textNo,
                                    ),
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
                SizedBox(height: 25),

                /// SP02 card
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EditSP02(),
                    ),
                  ),
                  child: Container(
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
                                bottomLeft:
                                Radius.circular(Dimensions.radius20),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Nhịp tim:',
                                style: black_kLabelStyle,
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  userHealthProfileModel.SP02 == null ||
                                      userHealthProfileModel.SP02.isEmpty
                                      ? Text(
                                    'Không có dữ liệu',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Palette.textNo,
                                    ),
                                  )
                                      : Text(
                                    '${userHealthProfileModel.SP02}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Palette.textNo,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'nhịp/phút',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Palette.textNo,
                                    ),
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
                SizedBox(height: 25),

                /// Blood group card
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EditBloodGroup(),
                    ),
                  ),
                  child: Container(
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
                                bottomLeft:
                                Radius.circular(Dimensions.radius20),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Nhóm máu:',
                                style: black_kLabelStyle,
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  userHealthProfileModel.bloodGroup == null ||
                                      userHealthProfileModel
                                          .bloodGroup.isEmpty
                                      ? Text(
                                    'Không có dữ liệu',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Palette.textNo,
                                    ),
                                  )
                                      : Text(
                                    '${userHealthProfileModel.bloodGroup}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Palette.textNo,
                                    ),
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
                SizedBox(height: 25),
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
