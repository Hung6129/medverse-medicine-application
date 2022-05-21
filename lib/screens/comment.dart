import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/utils/validation.dart';
import '/widgets/awesome_dialog.dart';
import '/theme/palette.dart';
import '/utils/app_text_theme.dart';
import '/components/stream_comments_wrapper.dart';
import '/models/comments.dart';
import '/models/post.dart';
import '/models/user.dart';
import '/services/post_service.dart';
import '/utils/firebase.dart';
import '/widgets/cached_image.dart';
import 'package:timeago/timeago.dart' as timeago;

class Comments extends StatefulWidget {
  final PostModel post;

  Comments({this.post});

  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  UserModel user;

  PostService services = PostService();

  /// Get the current datetime
  final DateTime timestamp = DateTime.now();

  /// Editting Controller
  TextEditingController commentsTEC = TextEditingController();

  /// Check validation
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  currentUserId() {
    return firebaseAuth.currentUser.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.xmark_circle_fill,
          ),
        ),
        centerTitle: true,
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'Bình luận bài viết',
          style: MobileTextTheme().appBarStyle,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: buildFullPost(),
                  ),
                  Divider(thickness: 1.5),
                  buildComments(),
                  commentWrapper(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Check validation then upload comment
  commentWrapper() {
    return Form(
      key: formKey,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(),
          constraints: BoxConstraints(
            maxHeight: 190.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: commentsTEC,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Theme.of(context).textTheme.headline6.color,
                    ),
                    validator: (value) {
                      if(value.isEmpty || RegExp(r"\s").hasMatch(commentsTEC.text)) {
                        return 'Mời bạn nhập nội dung bình luận';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintText: "Viết bình luận của bạn...",
                      hintStyle: TextStyle(
                        fontSize: 15.0,
                        color: Theme.of(context).textTheme.headline6.color,
                      ),
                    ),
                    maxLines: null,
                  ),
                  trailing: GestureDetector(
                    onTap: () async {
                      String input = commentsTEC.text;

                      if (cleanComment(input)) {
                        if(formKey.currentState.validate()) {
                          await services.uploadComment(
                            currentUserId(),
                            commentsTEC.text,
                            widget.post.postId,
                            widget.post.ownerId,
                            widget.post.mediaUrl,
                          );
                        }
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
                              'Bình luận bạn nhập có chứa nội dung vi phạm tiêu chuẩn cộng đồng của chúng tôi',
                          descTextStyle: AppTextTheme.oswaldTextStyle,
                          btnOkOnPress: () {},
                        ).show();
                      }
                      commentsTEC.clear();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(
                        Icons.send,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Check bad word comment
  bool cleanComment(String commentInput) {
    List<String> inputArray = commentInput.split(" ");
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

  buildFullPost() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          child: cachedNetworkImage(widget.post.mediaUrl),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
/*            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,*/
            children: [
              Text(
                widget.post.description,
                style: MobileTextTheme().postDescription,
              ),
              SizedBox(height: 4.0),
              Row(
                children: [
                  StreamBuilder(
                    stream: likesRef
                        .where('postId', isEqualTo: widget.post.postId)
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        QuerySnapshot snap = snapshot.data;
                        List<DocumentSnapshot> docs = snap.docs;
                        return buildLikesCount(context, docs?.length ?? 0);
                      } else {
                        return buildLikesCount(context, 0);
                      }
                    },
                  ),
                  buildLikeButton(),
                  Spacer(),
                  Text(
                    timeago.format(
                      widget.post.timestamp.toDate(),
                    ),
                    style: TextStyle(),
                  ),
                  SizedBox(width: 3.0),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  buildComments() {
    return CommentsStreamWrapper(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      stream: commentRef
          .doc(widget.post.postId)
          .collection('comments')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, DocumentSnapshot snapshot) {
        CommentModel comments = CommentModel.fromJson(snapshot.data());
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              leading: CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(comments.userDp),
              ),
              title: Text(
                comments.username,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              subtitle: Text(
                timeago.format(comments.timestamp.toDate()),
                style: TextStyle(fontSize: 12.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                comments.comment,
                style: MobileTextTheme().postDescription,
              ),
            ),
            Divider()
          ],
        );
      },
    );
  }

  buildLikeButton() {
    return StreamBuilder(
      stream: likesRef
          .where('postId', isEqualTo: widget.post.postId)
          .where('userId', isEqualTo: currentUserId())
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          List<QueryDocumentSnapshot> docs = snapshot?.data?.docs ?? [];
          return IconButton(
            onPressed: () {
              if (docs.isEmpty) {
                likesRef.add({
                  'userId': currentUserId(),
                  'postId': widget.post.postId,
                  'dateCreated': Timestamp.now(),
                });
                addLikesToNotification();
              } else {
                likesRef.doc(docs[0].id).delete();

                removeLikeFromNotification();
              }
            },
            icon: docs.isEmpty
                ? Icon(
                    CupertinoIcons.heart,
                  )
                : Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.red,
                  ),
          );
        }
        return Container();
      },
    );
  }

  buildLikesCount(BuildContext context, int count) {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0),
      child: Text(
        '$count likes',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10.0,
        ),
      ),
    );
  }

  addLikesToNotification() async {
    bool isNotMe = currentUserId() != widget.post.ownerId;

    if (isNotMe) {
      DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
      user = UserModel.fromJson(doc.data());
      notificationRef
          .doc(widget.post.ownerId)
          .collection('notifications')
          .doc(widget.post.postId)
          .set(
        {
          "type": "like",
          "username": user.username,
          "userId": currentUserId(),
          "userDp": user.photoUrl,
          "postId": widget.post.postId,
          "mediaUrl": widget.post.mediaUrl,
          "timestamp": timestamp,
        },
      );
    }
  }

  removeLikeFromNotification() async {
    bool isNotMe = currentUserId() != widget.post.ownerId;

    if (isNotMe) {
      DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
      user = UserModel.fromJson(doc.data());
      notificationRef
          .doc(widget.post.ownerId)
          .collection('notifications')
          .doc(widget.post.postId)
          .get()
          .then(
            (doc) => {
              if (doc.exists)
                {
                  doc.reference.delete(),
                }
            },
          );
    }
  }
}
