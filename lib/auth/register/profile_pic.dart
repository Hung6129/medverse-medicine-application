import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import '/theme/palette.dart';
import '/utils/app_text_theme.dart';
import '/components/custom_image.dart';
import '/view_models/auth/posts_view_model.dart';
import '/widgets/indicators.dart';

class ProfilePicture extends StatefulWidget {
  @override
  _ProfilePictureState createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  @override
  Widget build(BuildContext context) {
    PostsViewModel viewModel = Provider.of<PostsViewModel>(context);
    return WillPopScope(
      onWillPop: () async {
        viewModel.resetPost();
        return true;
      },
      child: ModalProgressHUD(
        progressIndicator: circularProgress(context),
        inAsyncCall: viewModel.loading,
        child: Scaffold(
          key: viewModel.scaffoldKey,
          appBar: AppBar(
            title: Text('Thêm một ảnh đại diện'),
            centerTitle: true,
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            children: [
              InkWell(
                onTap: () => showImageChoices(context, viewModel),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                    color: Palette.grey300,
                    borderRadius: BorderRadius.all(
                      Radius.circular(3.0),
                    ),
                    border: Border.all(
                      color: Theme.of(context).accentColor,
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
                                'Tải ảnh đại diện của bạn lên đây',
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                ),
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
              SizedBox(height: 10.0),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).accentColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Đã hoàn tất',
                      style: AppTextTheme.oswaldTextStyle,
                    ),
                  ),
                  onPressed: () => viewModel.uploadProfilePicture(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
                  'Lựa chọn',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Feather.camera),
                title: Text('Chọn từ máy ảnh'),
                onTap: () {
                  Navigator.pop(context);
                  viewModel.pickImage(camera: true);
                },
              ),
              ListTile(
                leading: Icon(Feather.image),
                title: Text('Chọn từ thư viện'),
                onTap: () {
                  Navigator.pop(context);
                  viewModel.pickImage();
                  // viewModel.pickProfilePicture();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
