import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/theme/palette.dart';
import '/auth/login/login.dart';
import '/auth/register/register.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Image.asset(
                  'assets/icons/medverseIcon.png',
                  height: 200.0,
                  width: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Medverse App',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w900,
                fontFamily: 'Ubuntu-Regular',
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    CupertinoPageRoute(
                      builder: (_) => Login(),
                    ),
                  );
                },
                child: Container(
                  height: 45.0,
                  width: 130.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    border: Border.all(color: Palette.mainBlueTheme),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Palette.mainBlueTheme,
                        Palette.mainBlueTheme,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Palette.whiteText,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      CupertinoPageRoute(builder: (_) => Register()));
                },
                child: Container(
                  height: 45.0,
                  width: 130.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    border: Border.all(color: Palette.mainBlueTheme),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Palette.mainBlueTheme,
                        Palette.mainBlueTheme,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Đăng ký',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Palette.whiteText,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
