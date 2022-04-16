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

    /// Check if user is authenticated
    if (user != null) {
      _checkAuthentication = new Scaffold(
        body: new SingleChildScrollView(
            child: Column(
          children: <Widget>[
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
                    Row(
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: Palette.textNo,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Tên người dùng:',
                          style: black_kLabelStyle,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    loggedInUser.username == null ||
                            loggedInUser.username.isEmpty
                        ? Text(
                            'Không có dữ liệu',
                          )
                        : Text(
                            '${loggedInUser.username}',
                            style: TextStyle(
                              color: Palette.textNo,
                            ),
                          ),
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
                    Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: Palette.textNo,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Email người dùng:',
                          style: black_kLabelStyle,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    loggedInUser.email == null || loggedInUser.email.isEmpty
                        ? Text(
                            'Không có dữ liệu',
                          )
                        : Text(
                            '${loggedInUser.email}',
                            style: TextStyle(
                              color: Palette.textNo,
                            ),
                          ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),

            /// Country card
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
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_sharp,
                          color: Palette.textNo,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Quốc gia:',
                          style: black_kLabelStyle,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    loggedInUser.country == null || loggedInUser.country.isEmpty
                        ? Text(
                            'Không có dữ liệu',
                          )
                        : Text(
                            '${loggedInUser.country}',
                            style: TextStyle(
                              color: Palette.textNo,
                            ),
                          ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),

            /// Giới thiệu
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
                    Row(
                      children: [
                        Icon(
                          Icons.info_rounded,
                          color: Palette.textNo,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Giới thiệu:',
                          style: black_kLabelStyle,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    loggedInUser.bio == null || loggedInUser.bio.isEmpty
                        ? Text(
                            'Không có dữ liệu',
                          )
                        : Text(
                            '${loggedInUser.bio}',
                            style: TextStyle(
                              color: Palette.textNo,
                            ),
                          ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        )),
      );
    } else {
      _checkAuthentication = new Login();
    }
    return _checkAuthentication;
  }
}
