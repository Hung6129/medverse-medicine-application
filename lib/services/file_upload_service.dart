import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '/models/user.dart';

/// Call Firebase FireStore
final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class FileUploadService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadPostFile({File file}) async {
    try {
      String fileName = basename(file.path);

      Reference storageRef =
      _firebaseStorage.ref().child('posts').child(fileName);

      UploadTask storageUploadTask = storageRef.putFile(file);

      TaskSnapshot snapshot = await storageUploadTask
          .whenComplete(() => storageRef.getDownloadURL());

      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      debugPrint('############ $e');
      return null;
    }
  }
}
