import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/utils/app_text_theme.dart';
import '/auth/login/login.dart';
import '/widgets/dimension.dart';
import '/models/user_health_profile_model.dart';
import '/theme/palette.dart';

class EditSP02 extends StatefulWidget {
  const EditSP02({Key key}) : super(key: key);

  @override
  _EditHealthProfilePageState createState() => _EditHealthProfilePageState();
}

class _EditHealthProfilePageState extends State<EditSP02> {
  /// Call Firebase authentication
  final _auth = FirebaseAuth.instance;

  /// String for displaying the error Message
  String errorMessage;

  /// Our form key
  final _formKey = GlobalKey<FormState>();

  /// Editing Controller
  final sp02EditingController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// SP02 field
    final sp02Field = TextFormField(
      autofocus: false,
      controller: sp02EditingController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value.trim().isEmpty) {
          return "Hãy nhập chỉ số nhịp tim";
        }
        return null;
      },
      onSaved: (value) {
        sp02EditingController.text = value;
      },
      textInputAction: TextInputAction.next,
      style: TextStyle(color: Palette.textNo),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.favorite,
          color: Palette.textNo,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Mời bạn nhập nhịp tim",
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
              sp02EditingController.text,
            );
          },
          child: Text(
            "Cập nhật",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Palette.p1, fontWeight: FontWeight.bold),
          )),
    );

    Widget _checkAuthentication;
    if (_auth.currentUser != null) {
      _checkAuthentication = new Scaffold(
        backgroundColor: Palette.p1,
        appBar: AppBar(
          backgroundColor: Palette.mainBlueTheme,
          title: Text(
            'Nhập chỉ số nhịp tim',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(25.0),
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
                          'Chỉ số nhịp tim',
                          style: MobileTextTheme().blackKLabelStyle,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    sp02Field,
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
      _checkAuthentication = new Login();
    }
    return _checkAuthentication;
  }

  updateDetailsToFirestore(String SP02) async {
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
        userHealthProfileModel.SP02 = sp02EditingController.text;

        /// Connect to Health Profile Model
        await firebaseFirestore
            .collection("healthProfile")
            .doc(user?.uid)
            .update(userHealthProfileModel.updateSP02())
            .catchError((e) {
          Fluttertoast.showToast(msg: e.message);
        });
        Fluttertoast.showToast(
          msg: "Cập nhật chỉ số nhịp tim thành công",
          backgroundColor: Palette.activeButton,
        );
        Navigator.of(context).pop();
      } on FirebaseAuthException catch (error) {
        Fluttertoast.showToast(msg: errorMessage);
        print(error.code);
      }
    }
  }
}
