import 'dart:io';
import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
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

  Future getImage() async {
    try {
      var pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        _image = File(pickedImage.path);
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to capture image: $e');
    }
  }

  Future uploadImageToFirebase(BuildContext context) async {
    WidgetsFlutterBinding.ensureInitialized();
    await firebase_core.Firebase.initializeApp();
    String fileName = basename(_image.path);
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('drug-report')
        .child('/$fileName');

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': fileName});
    firebase_storage.UploadTask uploadTask;
    //late StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    uploadTask = ref.putFile(io.File(_image.path), metadata);

    firebase_storage.UploadTask task = await Future.value(uploadTask);
    Future.value(uploadTask)
        .then((value) => {
              showSuccess(),
            })
        .onError((error, stackTrace) => {
              showError(),
            });
  }

  Future<File> saveImage(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  showSuccess() => Fluttertoast.showToast(
        msg: "Đăng ảnh thành công",
        fontSize: 18,
        backgroundColor: Palette.activeButton,
        textColor: Palette.whiteText,
        gravity: ToastGravity.CENTER,
      );

  showError() => Fluttertoast.showToast(
        msg: "Đăng ảnh thất bại",
        fontSize: 18,
        gravity: ToastGravity.CENTER,
        backgroundColor: Palette.red,
        textColor: Palette.whiteText,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'Báo cáo thuốc đến Admin',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: _image != null
            ? Image.file(_image)
            : const Text(
                "Chưa có ảnh. Mời bạn lựa chọn hình ảnh",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
      floatingActionButton: _getCondition(context),
    );
  }

  Widget _getCondition(BuildContext context) {
    if (_image != null) {
      return FloatingActionButton(
        onPressed: () => uploadImageToFirebase(context),
        backgroundColor: Palette.mainBlueTheme,
        child: const Icon(Icons.upload_sharp),
      );
    } else {
      return FloatingActionButton(
        onPressed: getImage,
        backgroundColor: Palette.mainBlueTheme,
        child: const Icon(Icons.camera_alt_rounded),
      );
    }
  }
}
