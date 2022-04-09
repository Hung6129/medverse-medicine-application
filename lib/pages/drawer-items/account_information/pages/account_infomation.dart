import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medverse_mobile_app/auth/login/login.dart';
import '/widgets/constants.dart';
import '/theme/palette.dart';
import '/widgets/dimension.dart';

class AccountInformation extends StatefulWidget {
  const AccountInformation({Key key}) : super(key: key);

  @override
  State<AccountInformation> createState() => _AccountInfomationState();
}

class _AccountInfomationState extends State<AccountInformation> {
  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    Widget _checkAuthentication;

    if(user != null) {
      _checkAuthentication = new Scaffold(
        body: new SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Họ',
                              style: black_kLabelStyle,
                            ),
                            SizedBox(height: 20),
                            Text(''),
                          ],
                        ),
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
