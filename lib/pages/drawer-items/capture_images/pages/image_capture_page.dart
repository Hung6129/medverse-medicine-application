import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '/auth/login/login.dart';
import '/utils/app_text_theme.dart';
import '/view_models/auth/capture_image_view_model.dart';
import '/widgets/indicators.dart';
import 'package:provider/provider.dart';
import '/widgets/awesome_dialog.dart';
import '/utils/validation.dart';
import '/components/custom_image.dart';
import '/models/user.dart';
import '/utils/firebase.dart';
import '/theme/palette.dart';

class CaptureimagePage extends StatefulWidget {
  @override
  _CaptureimagePageState createState() {
    return _CaptureimagePageState();
  }
}

class _CaptureimagePageState extends State<CaptureimagePage> {
  File _image;
  final imagePicker = ImagePicker();

  /// Get current user
  User user = FirebaseAuth.instance.currentUser;

  /// Editing Controllers
  TextEditingController reportDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    currentUserId() {
      return firebaseAuth.currentUser.uid;
    }

    CaptureImageViewModel viewModel =
        Provider.of<CaptureImageViewModel>(context);
    return WillPopScope(
      onWillPop: () async {
        await viewModel.resetPost();
        return true;
      },
      child: ModalProgressHUD(
        progressIndicator: circularProgress(context),
        inAsyncCall: viewModel.loading,
        child: user != null
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: Palette.mainBlueTheme,
                  title: Text(
                    'Báo cáo thuốc đến Admin',
                    style: MobileTextTheme().appBarStyle,
                  ),
                  actions: [
                    GestureDetector(
                      onTap: () async {
                        String input = reportDescription.text;

                        if (cleanDescription(input)) {
                          await viewModel.uploadCapture(context);
                          viewModel.resetPost();
                        } else {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.WARNING,
                            headerAnimationLoop: false,
                            animType: AnimType.TOPSLIDE,
                            showCloseIcon: true,
                            closeIcon:
                                const Icon(Icons.close_fullscreen_outlined),
                            title: 'Cảnh báo!',
                            desc:
                                'Mô tả bạn nhập có chứa ký tự vi phạm tiêu chuẩn cộng đồng của chúng tôi',
                            descTextStyle: AppTextTheme.oswaldTextStyle,
                            btnCancelOnPress: () {},
                            btnCancelText: 'Hủy bỏ',
                          ).show();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Gửi',
                          style: MobileTextTheme().appBarActionButton,
                        ),
                      ),
                    )
                  ],
                  centerTitle: true,
                ),
                body: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  children: [
                    SizedBox(height: 15.0),
                    StreamBuilder(
                      stream: usersRef.doc(currentUserId()).snapshots(),
                      builder:
                          (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasData) {
                          UserModel user =
                              UserModel.fromJson(snapshot.data.data());
                          return ListTile(
                            leading: CircleAvatar(
                              radius: 25.0,
                              backgroundImage: NetworkImage(user?.photoUrl),
                            ),
                            title: Text(
                              user?.username,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              user?.email,
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                    buildForm(context, viewModel),
                  ],
                ),
              )
            : new Login(),
      ),
    );
  }

  buildForm(BuildContext context, CaptureImageViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => showImageChoices(context, viewModel),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                border: Border.all(
                  color: Theme.of(context).accentColor,
                ),
              ),
              child: viewModel.imgLink != null
                  ? CustomImage(
                      imageUrl: viewModel.imgLink,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width - 30,
                      fit: BoxFit.cover,
                    )
                  : viewModel.captureUrl == null
                      ? Center(
                          child: Text(
                            'Mời bạn ấn vào đây để tải ảnh lên.',
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        )
                      : Image.file(
                          viewModel.captureUrl,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width - 30,
                          fit: BoxFit.cover,
                        ),
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Mô tả báo cáo'.toUpperCase(),
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextFormField(
            controller: reportDescription,
            decoration: InputDecoration(
              hintText: 'Mời bạn nhập mô tả!',
              focusedBorder: UnderlineInputBorder(),
            ),
            validator: (value) {
              if (value.trim().isEmpty) {
                return ("Mời bạn nhập mô tả báo cáo");
              }
              return null;
            },
            onSaved: (value) {
              reportDescription.text = value;
            },
            maxLines: null,
            onChanged: (val) => viewModel.setDescription(val),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  /// Check bad word comment
  bool cleanDescription(String descriptionInput) {
    List<String> inputArray = descriptionInput.split(" ");
    bool result = true;
    for (final item in inputArray) {
      for (final badWord in Validations.badWord) {
        if (item.toLowerCase() == badWord) {
          print(item.toLowerCase());
          print(badWord);
          print('Test');
          result = false;
        }
      }
    }
    return result;
  }

  showImageChoices(BuildContext context, CaptureImageViewModel viewModel) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: .6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Lựa chọn hình ảnh',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Feather.camera),
                title: Text('Chọn từ máy ảnh'),
                onTap: () {
                  Navigator.pop(context);
                  viewModel.pickImage(camera: true);
                },
              ),
              ListTile(
                leading: Icon(Feather.image),
                title: Text('Chọn từ thư viện'),
                onTap: () {
                  Navigator.pop(context);
                  viewModel.pickImage();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
