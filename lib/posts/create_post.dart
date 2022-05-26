import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import '/widgets/awesome_dialog.dart';
import '/components/custom_image.dart';
import '/models/user.dart';
import '/utils/firebase.dart';
import '/utils/validation.dart';
import '/utils/app_text_theme.dart';
import '/view_models/auth/posts_view_model.dart';
import '/widgets/indicators.dart';
import '/theme/palette.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  /// Editing Controllers
  TextEditingController description = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    currentUserId() {
      return firebaseAuth.currentUser.uid;
    }

    PostsViewModel viewModel = Provider.of<PostsViewModel>(context);
    return WillPopScope(
      onWillPop: () async {
        await viewModel.resetPost();
        return true;
      },
      child: ModalProgressHUD(
        progressIndicator: circularProgress(context),
        inAsyncCall: viewModel.loading,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Palette.mainBlueTheme,
            leading: IconButton(
              icon: Icon(Feather.x),
              onPressed: () {
                viewModel.resetPost();
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Tạo bài viết',
              style: MobileTextTheme().appBarStyle,
            ),
            centerTitle: true,
            actions: [
              GestureDetector(
                onTap: () async {
                  String input = description.text;

                  if (cleanDescription(input)) {
                    await viewModel.uploadPosts(context);
                    loading = true;
                    viewModel.resetPost();
                  } else {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.WARNING,
                      headerAnimationLoop: false,
                      animType: AnimType.TOPSLIDE,
                      showCloseIcon: true,
                      closeIcon: const Icon(Icons.close_fullscreen_outlined),
                      title: 'Cảnh báo!',
                      desc:
                          'Mô tả bạn nhập có chứa ký tự vi phạm tiêu chuẩn cộng đồng của chúng tôi',
                      descTextStyle: AppTextTheme.oswaldTextStyle,
                      btnCancelOnPress: () {},
                      btnCancelText: 'Hủy bỏ',
                    ).show();
                  }
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  child: Text(
                    'Đăng bài',
                    style: MobileTextTheme().appBarActionButton,
                  ),
                ),
              )
            ],
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            children: [
              SizedBox(height: 15.0),
              StreamBuilder(
                stream: usersRef.doc(currentUserId()).snapshots(),
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
                  }
                  return Container();
                },
              ),
              buildForm(context, viewModel),
            ],
          ),
        ),
      ),
    );
  }

  buildForm(BuildContext context, PostsViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => showImageChoices(context, viewModel),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                color: Palette.grey300,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                border: Border.all(
                  color: Palette.mainBlueTheme,
                ),
              ),
              child: viewModel.imgLink != null
                  ? CustomImage(
                      imageUrl: viewModel.imgLink,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width - 30,
                      fit: BoxFit.cover,
                    )
                  : viewModel.mediaUrl == null
                      ? Center(
                          child: Text(
                            'Nhấn vào đây để tải hình ảnh lên',
                            style: MobileTextTheme().choosePictureRequired,
                          ),
                        )
                      : Image.file(
                          viewModel.mediaUrl,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width - 30,
                          fit: BoxFit.cover,
                        ),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            children: [
              Text(
                'Mô tả bài viết'.toUpperCase(),
                style: MobileTextTheme().inputDescriptionAndLocationTitle,
              ),
              SizedBox(width: 5),
              Text(
                '*',
                style: TextStyle(
                  color: Palette.red,
                ),
              ),
            ],
          ),
          TextFormField(
            style: MobileTextTheme().inputDescriptionAndLocation,
            controller: description,
            decoration: InputDecoration(
              hintText: 'Eg. Đây là một bức hình đẹp',
              focusedBorder: UnderlineInputBorder(),
            ),
            validator: (value) {
              if (value.isEmpty || RegExp(r"\s").hasMatch(description.text)) {
                return ("Mời bạn nhập mô tả bài viết");
              }
              return null;
            },
            onSaved: (value) {
              description.text = value;
            },
            maxLines: null,
            onChanged: (val) => viewModel.setDescription(val),
          ),
          SizedBox(height: 20.0),
          Text(
            'Vị trí'.toUpperCase(),
            style: MobileTextTheme().inputDescriptionAndLocationTitle,
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0.0),
            title: Container(
              width: 250.0,
              child: TextFormField(
                style: MobileTextTheme().inputDescriptionAndLocation,
                controller: viewModel.locationTEC,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0.0),
                  hintText: 'Việt Nam, Hồ Chí Minh',
                  focusedBorder: UnderlineInputBorder(),
                ),
                maxLines: null,
                onChanged: (val) => viewModel.setLocation(val),
              ),
            ),
            trailing: IconButton(
              tooltip: "Sử dụng vị trí hiện tại của bạn",
              icon: Icon(
                CupertinoIcons.map_pin_ellipse,
                size: 25.0,
              ),
              iconSize: 30.0,
              color: Palette.mainBlueTheme,
              onPressed: () => viewModel.getLocation(),
            ),
          ),
        ],
      ),
    );
  }

  /// Check bad word comment
  bool cleanDescription(String descriptionInput) {
    List<String> inputArray = descriptionInput.split(" ");
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

  /// Show box select image choice
  showImageChoices(BuildContext context, PostsViewModel viewModel) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: .6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Lựa chọn hình ảnh',
                  style: MobileTextTheme().chooseImageTitle,
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Feather.camera),
                title: Text(
                  'Chọn từ máy ảnh',
                  style: MobileTextTheme().selectCamera,
                ),
                onTap: () {
                  Navigator.pop(context);
                  viewModel.pickImage(camera: true);
                },
              ),
              ListTile(
                leading: Icon(Feather.image),
                title: Text(
                  'Chọn từ thư viện',
                  style: MobileTextTheme().selectGallery,
                ),
                onTap: () {
                  Navigator.pop(context);
                  viewModel.pickImage();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  postSuccessfully(context) async {
    showInSnackBar('Không có kết nối mạng', context);
  }

  void showInSnackBar(String value, context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(value),
      ),
    );
  }
}
