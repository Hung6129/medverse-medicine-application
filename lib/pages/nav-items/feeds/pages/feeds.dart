import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:medverse_mobile_app/auth/login/login.dart';
import 'package:medverse_mobile_app/theme/palette.dart';
import 'package:medverse_mobile_app/widgets/navigation_drawer_widget.dart';
import '../../../../components/fab_container.dart';
import '/models/post.dart';
import '/utils/firebase.dart';
import '/widgets/indicators.dart';
import '/widgets/userpost.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  /// Get the current authentication
  User user = FirebaseAuth.instance.currentUser;

  /// Check validation
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  /// Create new post list
  List<DocumentSnapshot> post = [];

  bool isLoading = false;

  bool hasMore = true;

  int documentLimit = 10;

  DocumentSnapshot lastDocument;

  ScrollController _scrollController;

  /// Get all post from firebase
  getPosts() async {
    if (!hasMore) {
      print('Hiện chưa có bài viết nào');
    }
    if (isLoading) {
      return CircularProgressIndicator();
    }
    setState(() {
      isLoading = true;
    });
    QuerySnapshot querySnapshot;
    if (lastDocument == null) {
      querySnapshot = await postRef
          .orderBy('timestamp', descending: false)
          .limit(documentLimit)
          .get();
    } else {
      querySnapshot = await postRef
          .orderBy('timestamp', descending: false)
          .startAfterDocument(lastDocument)
          .limit(documentLimit)
          .get();
    }
    if (querySnapshot.docs.length < documentLimit) {
      hasMore = false;
    }
    lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
    post.addAll(querySnapshot.docs);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getPosts();
    _scrollController?.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.25;
      if (maxScroll - currentScroll <= delta) {
        getPosts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _checkAuthentication;

    if (user != null) {
      _checkAuthentication = new Scaffold(
        drawer: NavigationDrawerWidget(),
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Palette.mainBlueTheme,
          title: Text(
            'Mạng xã hội',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
        ),
        body: isLoading
            ? circularProgress(context)
            : ListView.builder(
                controller: _scrollController,
                itemCount: post.length,
                reverse: true,
                itemBuilder: (context, index) {
                  internetChecker(context);
                  PostModel posts = PostModel.fromJson(
                    post[index].data(),
                  );
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: UserPost(
                      post: posts,
                    ),
                  );
                },
              ),
        floatingActionButton: buildFab(),
      );
    } else {
      _checkAuthentication = new Login();
    }
    return _checkAuthentication;
  }

  buildFab() {
    return Container(
      height: 45.0,
      width: 45.0,
      // ignore: missing_required_param
      child: FabContainer(
        icon: Feather.plus,
        mini: true,
      ),
    );
  }

  internetChecker(context) async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == false) {
      showInSnackBar('Không có kết nối mạng', context);
    }
  }

  void showInSnackBar(String value, context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }
}
