import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medverse_mobile_app/models/capture_image.dart';
import 'package:medverse_mobile_app/services/capture_image_service.dart';
import 'package:medverse_mobile_app/theme/palette.dart';
import '/models/post.dart';
import '/screens/mainscreen.dart';
import '/services/post_service.dart';
import '/services/user_service.dart';
import '/utils/constants.dart';
import '/utils/firebase.dart';

class CaptureImageViewModel extends ChangeNotifier {
  /// Connect to user's service
  UserService userService = UserService();

  /// Connect to capture image's service
  CaptureImageService captureImageService = CaptureImageService();

  /// Check all keys validation
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //Variables
  bool loading = false;
  String username;
  File captureUrl;
  final picker = ImagePicker();
  Position position;
  String description;
  String ownerId;
  String userId;
  String type;
  File userDp;
  String imgLink;
  bool edit = false;
  String id;

  /// Editing Controllers
  TextEditingController locationTEC = TextEditingController();

  // Setters
  setEdit(bool val) {
    edit = val;
    notifyListeners();
  }

  setPost(CaptureImageModel post) {
    if (post != null) {
      description = post.description;
      imgLink = post.captureUrl;
      edit = true;
      edit = false;
      notifyListeners();
    } else {
      edit = false;
      notifyListeners();
    }
  }

  setUsername(String val) {
    print('SetName $val');
    username = val;
    notifyListeners();
  }

  setDescription(String val) {
    print('SetDescription $val');
    description = val;
    notifyListeners();
  }

  //Functions
  pickImage({bool camera = false, BuildContext context}) async {
    loading = true;
    notifyListeners();
    try {
      PickedFile pickedFile = await picker.getImage(
        source: camera ? ImageSource.camera : ImageSource.gallery,
      );
      File croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Cắt hình',
          toolbarColor: Constants.lightAccent,
          toolbarWidgetColor: Palette.whiteText,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
      );

      captureUrl = File(croppedFile.path);
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      showInSnackBar('Hủy bỏ', context);
    }
  }

  uploadCapture(BuildContext context) async {
    try {
      loading = true;
      notifyListeners();
      await captureImageService.uploadCapture(captureUrl, description);
      loading = false;
      resetPost();
      notifyListeners();
    } catch (e) {
      print(e);
      loading = false;
      resetPost();
      showInSnackBar('Gửi bài báo cáo thành công!', context);
      notifyListeners();
    }
  }

  resetPost() {
    captureUrl = null;
    description = null;
    edit = null;
    notifyListeners();
  }

  void showInSnackBar(String value, context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }
}
