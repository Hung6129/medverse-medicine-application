import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/auth/login/login.dart';
import '/widgets/dimension.dart';
import '/theme/palette.dart';
import '/widgets/constants.dart';
import '/models/user_health_profile_model.dart';

class EditBMI extends StatefulWidget {
  const EditBMI({Key key}) : super(key: key);

  @override
  _EditHealthProfilePageState createState() => _EditHealthProfilePageState();
}

class _EditHealthProfilePageState extends State<EditBMI> {
  /// Call Firebase authentication
  final _auth = FirebaseAuth.instance;

  /// String for displaying the error Message
  String errorMessage;

  /// Our form key
  final _formKey = GlobalKey<FormState>();

  /// Editing Controller
  final bmiEditingController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// BMI field
    final bmiField = TextFormField(
      autofocus: false,
      controller: bmiEditingController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value.isEmpty) {
          return ("Hãy nhập chỉ số BMI");
        }
        return null;
      },
      onSaved: (value) {
        bmiEditingController.text = value;
      },
      textInputAction: TextInputAction.next,
      style: TextStyle(color: Palette.textNo),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.calculate,
          color: Palette.textNo,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Mời bạn nhập chỉ số BMI",
        hintStyle: TextStyle(
          color: Palette.textNo,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    /// Signup button
    final updateButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Palette.mainBlueTheme,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            updateDetailsToFirestore(
              bmiEditingController.text,
            );
          },
          child: Text(
            "Cập nhật",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Palette.p1, fontWeight: FontWeight.bold),
          )),
    );

    Widget _CheckAuthentication;
    if (_auth.currentUser != null) {
      _CheckAuthentication = new Scaffold(
        backgroundColor: Palette.p1,
        appBar: AppBar(
          backgroundColor: Palette.mainBlueTheme,
          title: Text(
            'Nhập chỉ số BMI',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chỉ số BMI',
                          style: black_kLabelStyle,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    bmiField,
                    SizedBox(height: 30),
                    updateButton,
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      _CheckAuthentication = new Login();
    }
    return _CheckAuthentication;
  }

  updateDetailsToFirestore(String bmi) async {
    if (_formKey.currentState.validate()) {
      try {
        /// Calling our firestore
        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
        /// Calling our user model
        User user = _auth.currentUser;
        /// Sending these values
        UserHealthProfileModel userHealthProfileModel =
            UserHealthProfileModel();

        /// Writing all the values
        userHealthProfileModel.uid = user?.uid;
        userHealthProfileModel.bmi = bmiEditingController.text;

        /// Connect to Health Profile Model
        await firebaseFirestore
            .collection("healthProfile")
            .doc(user?.uid)
            .update(userHealthProfileModel.updateBMI())
            .catchError((e) {
          Fluttertoast.showToast(msg: e.message);
        });
        Fluttertoast.showToast(msg: "Cập nhật hồ sơ sức khỏe thành công");
        Navigator.of(context).pop();
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage);
        print(error.code);
      }
    }
  }
}
