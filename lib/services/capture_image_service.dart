import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medverse_mobile_app/models/user.dart';
import 'package:medverse_mobile_app/services/services.dart';
import 'package:medverse_mobile_app/utils/firebase.dart';

import '/screens/view_image.dart';

class CaptureImageService extends Service {
  /// Uploads drug report to the drugReport collection
  uploadCapture(File image, String description) async {
    String link = await uploadImage(drugReport, image);
    DocumentSnapshot doc = await usersRef.doc(firebaseAuth.currentUser.uid).get();
    user = UserModel.fromJson(doc.data());

    var ref = drugReportRef.doc();
    ref.set({
      "id": ref.id,
      "captureId": ref.id,
      "username": user.username,
      "ownerId": firebaseAuth.currentUser.uid,
      "captureUrl": link,
      "description": description ?? "",
      "timestamp": Timestamp.now(),
    }).catchError((e) {
      print(e);
    });
  }
}