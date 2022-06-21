import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/utils/app_text_theme.dart';
import '/models/user_health_profile_model.dart';
import '/auth/login/login.dart';
import '/widgets/dimension.dart';
import '/theme/palette.dart';

class EditBloodGroup extends StatefulWidget {
  const EditBloodGroup({Key key}) : super(key: key);

  @override
  _EditHealthProfilePageState createState() => _EditHealthProfilePageState();
}

class _EditHealthProfilePageState extends State<EditBloodGroup> {
  String dropdownValue = 'Mời bạn chọn nhóm máu';

  /// Call Firebase authentication
  final _auth = FirebaseAuth.instance;

  /// String for displaying the error Message
  String errorMessage;

  /// Our form key
  final _formKey = GlobalKey<FormState>();

  /// Editing Controller
  final bloodGroupEditingController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Blood group field
    final bloodGroupField = DropdownButtonFormField<String>(
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_downward,
        color: Palette.textNo,
      ),
      elevation: 16,
      style: const TextStyle(color: Palette.textNo),
      validator: (value) {
        if (dropdownValue == "Mời bạn chọn nhóm máu") {
          return "Hãy chọn nhóm máu phù hợp";
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
        'Mời bạn chọn nhóm máu',
        'Nhóm A+',
        'Nhóm A-',
        'Nhóm B+',
        'Nhóm B-',
        'Nhóm C+',
        'Nhóm C-',
        'Nhóm D+',
        'Nhóm D-',
        'Nhóm O+',
        'Nhóm O-',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
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
              dropdownValue,
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
            'Chọn nhóm máu',
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
                          'Nhóm máu',
                          style: MobileTextTheme().blackKLabelStyle,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    bloodGroupField,
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

  updateDetailsToFirestore(String bloodGroup) async {
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
        userHealthProfileModel.bloodGroup = dropdownValue;

        /// Connect to Health Profile Model
        await firebaseFirestore
            .collection("healthProfile")
            .doc(user?.uid)
            .update(userHealthProfileModel.updateBloodGroup())
            .catchError((e) {
          Fluttertoast.showToast(msg: e.message);
        });
        Fluttertoast.showToast(
          msg: "Cập nhật thông tin nhóm máu thành công",
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
