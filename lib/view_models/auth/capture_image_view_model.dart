import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '/models/capture_image.dart';
import '/services/capture_image_service.dart';
import '/theme/palette.dart';
import '/services/user_service.dart';
import '/utils/constants.dart';

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
      showErrorInSnackBar('Hủy bỏ', context);
    }
  }

  uploadCapture(BuildContext context) async {
    if (captureUrl == null) {
      showErrorInSnackBar('Vui lòng chọn hình ảnh', context);
    } else {
      if (formKey.currentState.validate()) {
        try {
          loading = true;
          notifyListeners();
          await captureImageService.uploadCapture(captureUrl, description);
          showActiveInSnackBar('Gửi bài báo cáo thành công!', context);
          Navigator.pushReplacementNamed(context, "/home");
          loading = false;
          resetPost();
          notifyListeners();
        } catch (e) {
          print(e);
          loading = false;
          resetPost();
          notifyListeners();
        }
      } else {
        loading = false;
        resetPost();
        notifyListeners();
        showErrorInSnackBar(
          'Vui lòng hoàn thành điền thông tin trước khi gửi báo cáo. ',
          context,
        );
      }
    }
  }

  resetPost() {
    captureUrl = null;
    description = null;
    edit = null;
    notifyListeners();
  }

  /// This message will show when validation is failed
  void showErrorInSnackBar(String value, context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          value,
          style: GoogleFonts.oswald(),
        ),
        backgroundColor: Palette.red,
      ),
    );
  }

  /// This message will show when validation is successful
  void showActiveInSnackBar(String value, context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          value,
          style: GoogleFonts.oswald(),
        ),
        backgroundColor: Palette.activeButton,
      ),
    );
  }
}
