import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/utils/app_text_theme.dart';
import '/auth/login/login.dart';
import '/widgets/dimension.dart';
import '/theme/palette.dart';
import '/models/user_health_profile_model.dart';

class EditBloodPressure extends StatefulWidget {
  const EditBloodPressure({Key key}) : super(key: key);

  @override
  _EditHealthProfilePageState createState() => _EditHealthProfilePageState();
}

class _EditHealthProfilePageState extends State<EditBloodPressure> {
  /// Call Firebase authentication
  final _auth = FirebaseAuth.instance;

  /// String for displaying the error Message
  String errorMessage;

  /// Our form key
  final _formKey = GlobalKey<FormState>();

  /// Editing Controller
  final sbpEditingController = new TextEditingController();
  final dbpEditingController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// SBP field
    final sbpField = TextFormField(
      autofocus: false,
      controller: sbpEditingController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{2,}$');
        if (value.trim().isEmpty) {
          return ("Hãy nhập chỉ số SBP");
        }
        if (!regex.hasMatch(value)) {
          return ("Hãy nhập mật khẩu hợp lệ (Tối thiểu 2 ký tự)");
        }
        return null;
      },
      onSaved: (value) {
        sbpEditingController.text = value;
      },
      textInputAction: TextInputAction.next,
      style: TextStyle(color: Palette.textNo),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.vpn_key,
          color: Palette.textNo,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Mời bạn nhập SBP",
        hintStyle: TextStyle(
          color: Palette.textNo,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    /// DBP field
    final dbpField = TextFormField(
      autofocus: false,
      controller: dbpEditingController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value.trim().isEmpty) {
          return "Hãy nhập chỉ số DBP";
        }
        return null;
      },
      onSaved: (value) {
        dbpEditingController.text = value;
      },
      textInputAction: TextInputAction.next,
      style: TextStyle(color: Palette.textNo),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.vpn_key,
          color: Palette.textNo,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Mời bạn nhập DBP",
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
              sbpEditingController.text,
              dbpEditingController.text,
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
            'Nhập chỉ số huyết áp',
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
                          'Huyết áp',
                          style: MobileTextTheme().blackKLabelStyle,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    sbpField,
                    SizedBox(height: 20),
                    dbpField,
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

  updateDetailsToFirestore(String SBP, String DBP) async {
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
        userHealthProfileModel.SBP = sbpEditingController.text;
        userHealthProfileModel.DBP = dbpEditingController.text;

        /// Connect to Health Profile Model
        await firebaseFirestore
            .collection("healthProfile")
            .doc(user?.uid)
            .update(userHealthProfileModel.updateBloodPressure())
            .catchError((e) {
          Fluttertoast.showToast(msg: e.message);
        });
        Fluttertoast.showToast(
          msg: "Cập nhật thông tin huyết áp thành công",
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
