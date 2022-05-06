import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class CaptureImageModel {
  String id;
  String captureId;
  String ownerId;
  String username;
  String description;
  String captureUrl;
  Timestamp timestamp;
  String pictureUrl;

  CaptureImageModel({
    this.id,
    this.captureId,
    this.ownerId,
    this.username,
    this.description,
    this.captureUrl,
    this.timestamp,
    this.pictureUrl,
  });

  CaptureImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    captureId = json['captureId'];
    ownerId = json['ownerId'];
    username = json['username'];
    description = json['description'];
    captureUrl = json['captureUrl'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['captureId'] = this.captureId;
    data['ownerId'] = this.ownerId;
    data['description'] = this.description;
    data['captureUrl'] = this.captureUrl;
    data['timestamp'] = this.timestamp;
    data['username'] = this.username;
    return data;
  }
}
