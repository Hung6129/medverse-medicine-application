import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/theme/palette.dart';
import '/utils/app_text_theme.dart';
import '/components/custom_card.dart';
import '/components/custom_image.dart';
import '/models/post.dart';
import '/models/user.dart';
import '/pages/drawer-items/profile/pages/profile.dart';
import '/pages/nav-items/feeds/widgets/edit_post_screen.dart';
import '/screens/comment.dart';
import '/screens/view_image.dart';
import '/services/post_service.dart';
import '/utils/firebase.dart';
import 'package:timeago/timeago.dart' as timeago;

class UserPost extends StatefulWidget {
  final PostModel post;
  final postId;

  UserPost({
    this.post,
    this.postId,
  });

  @override
  State<UserPost> createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  final DateTime timestamp = DateTime.now();

  currentUserId() {
    return firebaseAuth.currentUser.uid;
  }

  final PostService services = PostService();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: null,
      borderRadius: BorderRadius.circular(10.0),
      child: OpenContainer(
        transitionType: ContainerTransitionType.fadeThrough,
        openBuilder: (BuildContext context, VoidCallback _) {
          return ViewImage(post: widget.post);
        },
        closedElevation: 0.0,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        onClosed: (v) {},
        closedColor: Theme.of(context).cardColor,
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return Stack(
            children: [
              Column(
                children: [
                  buildUser(context),
                  SizedBox(height: 5.0),
                  ClipRRect(
                    child: CustomImage(
                      imageUrl: widget.post?.mediaUrl ?? '',
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Row(
                            children: [
                              buildLikeButton(),
                              InkWell(
                                borderRadius: BorderRadius.circular(10.0),
                                onTap: () {
                                  Navigator.of(context).push(
                                    CupertinoPageRoute(
                                      builder: (_) =>
                                          Comments(post: widget.post),
                                    ),
                                  );
                                },
                                child: Icon(
                                  CupertinoIcons.chat_bubble,
                                  size: 25.0,
                                ),
                              ),
                              buildCurrentUserEditPost(context),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: StreamBuilder(
                                  stream: likesRef
                                      .where('postId',
                                          isEqualTo: widget.post.postId, )
                                      .snapshots(),
                                  builder: (context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasData) {
                                      QuerySnapshot snap = snapshot.data;
                                      List<DocumentSnapshot> docs = snap.docs;
                                      return buildLikesCount(
                                          context, docs?.length ?? 0);
                                    } else {
                                      return buildLikesCount(context, 0);
                                    }
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 5.0),
                            StreamBuilder(
                              stream: commentRef
                                  .doc(widget.post.postId)
                                  .collection("comments")
                                  .snapshots(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasData) {
                                  QuerySnapshot snap = snapshot.data;
                                  List<DocumentSnapshot> docs = snap.docs;
                                  return buildCommentsCount(
                                      context, docs?.length ?? 0);
                                } else {
                                  return buildCommentsCount(context, 0);
                                }
                              },
                            ),
                          ],
                        ),
                        Visibility(
                          visible: widget.post.description != null &&
                              widget.post.description.toString().isNotEmpty,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, top: 3.0),
                            child: Text(
                              '${widget.post?.description ?? ""}',
                              style: MobileTextTheme().postDescription,
                              maxLines: 2,
                            ),
                          ),
                        ),
                        SizedBox(height: 3.0),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            timeago.format(
                              widget.post.timestamp.toDate(),
                            ),
                            style: MobileTextTheme().timePost,
                          ),
                        ),
                        // SizedBox(height: 5.0),
                      ],
                    ),
                  )
                ],
              ),
            ],
          );
        },
      ),
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
                services.removeLikeFromNotification(
                    widget.post.ownerId, widget.post.postId, currentUserId());
              }
            },
            icon: docs.isEmpty
                ? Icon(
                    CupertinoIcons.heart,
                  )
                : Icon(
                    CupertinoIcons.heart_fill,
                    color: Palette.red,
                  ),
          );
        }
        return Container();
      },
    );
  }

  addLikesToNotification() async {
    bool isNotMe = currentUserId() != widget.post.ownerId;

    if (isNotMe) {
      DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
      user = UserModel.fromJson(doc.data());
      services.addLikesToNotification(
          "like",
          user.username,
          currentUserId(),
          widget.post.postId,
          widget.post.mediaUrl,
          widget.post.ownerId,
          user.photoUrl);
    }
  }

  buildLikesCount(BuildContext context, int count) {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0),
      child: Text(
        '$count likes',
        style: MobileTextTheme().likesCount,
      ),
    );
  }

  buildCommentsCount(BuildContext context, int count) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.5),
      child: Text(
        '-   $count comments',
        style: MobileTextTheme().commentCount,
      ),
    );
  }

  /// Edit post button
  buildCurrentUserEditPost(BuildContext context) {
    /// Check if this post is your current authenticated
    bool isMe = currentUserId() != widget.post.ownerId;
    return StreamBuilder(
      stream: usersRef.doc(widget.post.ownerId).snapshots(),
      builder: (context, snapshot) {
        return Visibility(
          visible: !isMe,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (_) => EditPostScreen(
                    documentId: widget.post.postId,
                    currentUserID: widget.post.ownerId,
                    currentImageUrl: widget.post.mediaUrl,
                    currentDescription: widget.post.description,
                    currentLocation: widget.post.location,
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.edit_sharp,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        );
      },
    );
  }

  buildUser(BuildContext context) {
    return StreamBuilder(
      stream: usersRef.doc(widget.post.ownerId).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          DocumentSnapshot snap = snapshot.data;
          UserModel user = UserModel.fromJson(snap.data());
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 80.0,
              decoration: BoxDecoration(
                color: Palette.white60,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: GestureDetector(
                onTap: () => showProfile(context, profileId: user?.id),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      user.photoUrl.isNotEmpty
                          ? CircleAvatar(
                              radius: 14.0,
                              backgroundColor: Palette.greyBlack,
                              backgroundImage: CachedNetworkImageProvider(
                                  user?.photoUrl ?? ""),
                            )
                          : CircleAvatar(
                              radius: 14.0,
                              backgroundColor: Palette.greyBlack,
                            ),
                      SizedBox(width: 5.0),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.post?.username ?? ""}',
                            style: MobileTextTheme().postUserNameTitle,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${widget.post?.location ?? 'Không có vị trí'}',
                            style: MobileTextTheme().postLocationTitle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  showProfile(
    BuildContext context, {
    String profileId,
  }) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (_) => Profile(profileId: profileId),
      ),
    );
  }
}
