import 'package:cloud_firestore/cloud_firestore.dart';

class Likes {
  String username;
  String userId;
  String type; // like, follow, comment
  String mediaUrl;
  String postId;
  String userProfileImg;
  String commentData;
  Timestamp timestamp;

  Likes({
    this.username,
    this.userId,
    this.type,
    this.mediaUrl,
    this.postId,
    this.userProfileImg,
    this.commentData,
    this.timestamp,
  });

  factory Likes.fromDocument(DocumentSnapshot doc) {
    return Likes(
      username: doc['username'],
      userId: doc['userId'],
      type: doc['type'],
      mediaUrl: doc['mediaUrl'],
      postId: doc['postId'],
      userProfileImg: doc['userProfileImg'],
      commentData: doc['commentData'],
      timestamp: doc['timestamp'],
    );
  }
}
