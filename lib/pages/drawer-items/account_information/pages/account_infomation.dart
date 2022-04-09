import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medverse_mobile_app/models/user.dart';
import '/widgets/dimension.dart';
import '/widgets/constants.dart';
import '/theme/palette.dart';
import '/auth/login/login.dart';

class AccountInformation extends StatefulWidget {
  const AccountInformation({Key key}) : super(key: key);

  @override
  State<AccountInformation> createState() => _AccountInfomationState();
}

class _AccountInfomationState extends State<AccountInformation> {
  User user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel();

  @override
  Widget build(BuildContext context) {
    /// Get all data from users collection
    FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromJson(value.data());
      setState(() {});
    });

    Widget _checkAuthentication;

    if(user != null) {
      _checkAuthentication = new Scaffold(
        body: new SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                /// Username card
                Container(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Tên người dùng:',
                          style: black_kLabelStyle,
                        ),
                        SizedBox(height: 20),
                        Text('${loggedInUser.username}'),
                      ],
                    ),
                  ),
                ),
                /// Email card
                Container(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(children: [
                          Icon(Icons.email),
                          SizedBox(width: 10),
                          Text(
                            'Email người dùng:',
                            style: black_kLabelStyle,
                          ),
                        ],),
                        SizedBox(height: 20),
                        Text('${loggedInUser.email}'),
                      ],
                    ),
                  ),
                ),
              ],
            )
        ),
      );
    } else {
      _checkAuthentication = new Login();
    }
    return _checkAuthentication;
  }
}
