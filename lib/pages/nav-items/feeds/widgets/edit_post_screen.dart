import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/widgets/awesome_dialog.dart';
import '/models/user.dart';
import '/utils/app_text_theme.dart';
import '/utils/firebase.dart';
import '/models/post.dart';
import '/theme/palette.dart';
import '/pages/nav-items/feeds/widgets/edit_post_form.dart';

class EditPostScreen extends StatefulWidget {
  final String documentId;
  final String currentUserID;
  final String currentImageUrl;
  final String currentDescription;
  final String currentLocation;

  /// Connect to Post Manager model
  final PostModel post;

  EditPostScreen({
    this.documentId,
    this.currentUserID,
    this.currentImageUrl,
    this.currentDescription,
    this.currentLocation,
    this.post,
  });

  @override
  State<EditPostScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditPostScreen> {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  /// Loading animation
  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.mainBlueTheme,
          title: Text(
            'Chỉnh sửa bài viết',
            style: MobileTextTheme().appBarStyle,
          ),
          centerTitle: true,
          actions: [
            _isDeleting
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      right: 16.0,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Palette.red,
                      ),
                      strokeWidth: 3,
                    ),
                  )
                : IconButton(
                    onPressed: () async {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        headerAnimationLoop: false,
                        animType: AnimType.TOPSLIDE,
                        showCloseIcon: true,
                        closeIcon: const Icon(Icons.close_fullscreen_outlined),
                        title: 'Thông báo',
                        desc: 'Bạn có chắc muốn xóa bài viết này?',
                        descTextStyle: AppTextTheme.oswaldTextStyle,
                        btnCancelText: 'Hủy bỏ',
                        btnCancelOnPress: () {},
                        btnOkText: 'Xóa',
                        btnOkOnPress: () async {
                          setState(
                            () {
                              _isDeleting = true;
                            },
                          );

                          /// Calling delete post method in Post Manager model
                          deletePost();
                          setState(
                            () {
                              _isDeleting = false;
                            },
                          );
                          Navigator.of(context).pop();
                        },
                      ).show();
                    },
                    icon: Icon(
                      Icons.delete_forever,
                      color: Palette.red,
                      size: 32,
                    ),
                  ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          children: [
            SizedBox(height: 15.0),
            StreamBuilder(
              stream: usersRef.doc(firebaseAuth.currentUser.uid).snapshots(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData) {
                  UserModel user = UserModel.fromJson(snapshot.data.data());
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(user?.photoUrl),
                    ),
                    title: Text(
                      user?.username,
                      style: MobileTextTheme().currentUsernameTitle,
                    ),
                    subtitle: Text(
                      user?.email,
                      style: MobileTextTheme().currentEmailTitle,
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            EditItemForm(
              documentId: widget.documentId,
              currentImageUrl: widget.currentImageUrl,
              currentDescription: widget.currentDescription,
              currentLocation: widget.currentLocation,
              titleFocusNode: _titleFocusNode,
              descriptionFocusNode: _descriptionFocusNode,
            ),
          ],
        ),
      ),
    );
  }

  /// You can only delete your own posts
  deletePost() async {
    postRef.doc(widget.documentId).delete();

    ///delete notification associated with that given post
    QuerySnapshot notificationsSnap = await notificationRef
        .doc(widget.post.ownerId)
        .collection('notifications')
        .where('postId', isEqualTo: widget.post.postId)
        .get();
    notificationsSnap.docs.forEach(
          (doc) {
        if (doc.exists) {
          doc.reference.delete();
        }
      },
    );

    /// Delete all the comments associated with that given post
    QuerySnapshot commentSnapshot =
    await commentRef.doc(widget.post.postId).collection('comments').get();
    commentSnapshot.docs.forEach(
          (doc) {
        if (doc.exists) {
          doc.reference.delete();
        }
      },
    );
  }
}
