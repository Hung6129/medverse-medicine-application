import 'package:google_fonts/google_fonts.dart';
import 'package:medverse_mobile_app/utils/app_text_theme.dart';

import '/models/post.dart';
import '/theme/palette.dart';
import 'package:flutter/material.dart';
import '/utils/validation.dart';
import '/pages/nav-items/feeds/widgets/custom_form_field.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:unicons/unicons.dart';

class EditItemForm extends StatefulWidget {
  final String documentId;
  final String currentImageUrl;
  final String currentDescription;
  final String currentLocation;
  final FocusNode titleFocusNode;
  final FocusNode descriptionFocusNode;

  const EditItemForm({
    this.documentId,
    this.currentImageUrl,
    this.currentDescription,
    this.currentLocation,
    this.titleFocusNode,
    this.descriptionFocusNode,
  });

  @override
  State<EditItemForm> createState() => _EditItemFormState();
}

class _EditItemFormState extends State<EditItemForm> {
  /// Editing Controller
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  /// Connect to Post Manger model
  final PostModel _postModel = PostModel();
  File _postImageFile;
  final ImagePicker _imagePicker = ImagePicker();

  bool isLoading = false;

  /// Select image from camera or gallery
  selectImage(ImageSource imageSource) async {
    XFile file = await _imagePicker.pickImage(source: imageSource);
    File croppedFile = File(file.path);
    setState(() {
      _postImageFile = croppedFile;
    });
  }

  /// Check validation
  final _addItemFormKey = GlobalKey<FormState>();

  /// Loading processing
  bool _isProcessing = false;

  String updateImage = "";
  String updateDescription = "";
  String updateLocation = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _addItemFormKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8.0,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton.icon(
                                onPressed: () {
                                  Navigator.pop(context);
                                  selectImage(ImageSource.camera);
                                },
                                icon: const Icon(UniconsLine.camera),
                                label: const Text(
                                  'Chọn từ Máy ảnh',
                                ),
                              ),
                              const Divider(),
                              TextButton.icon(
                                onPressed: () {
                                  Navigator.pop(context);
                                  selectImage(ImageSource.gallery);
                                },
                                icon: const Icon(UniconsLine.picture),
                                label: const Text('Chọn từ Thư viện'),
                              ),
                            ],
                          );
                        },
                      );
                    },
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
                      child: _postImageFile == null
                          ? Image.network(
                              widget.currentImageUrl,
                              height: MediaQuery.of(context).size.width - 30,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              _postImageFile,
                              height: MediaQuery.of(context).size.width - 30,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    'Mô tả bài viết'.toUpperCase(),
                    style: MobileTextTheme().inputDescriptionAndLocationTitle,
                  ),
                  CustomFormField(
                    maxLines: null,
                    isLabelEnabled: false,
                    initialValue: widget.currentDescription,
                    controller: _descriptionController,
                    focusNode: widget.descriptionFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    validator: (value) {
                      Validations.validateField(
                        value: value,
                      );
                      updateDescription = value;
                    },
                    label: 'Mô tả bài viết',
                    hint: 'Eg. Đây là một bức hình đẹp',
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Vị trí'.toUpperCase(),
                    style: MobileTextTheme().inputDescriptionAndLocation,
                  ),
                  CustomFormField(
                    maxLines: null,
                    isLabelEnabled: false,
                    initialValue: widget.currentLocation,
                    controller: _locationController,
                    focusNode: widget.descriptionFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    validator: (value) {
                      Validations.validateField(
                        value: value,
                      );
                      updateLocation = value;
                    },
                    label: 'Vị trí',
                    hint: 'Việt Nam, Hồ Chí Minh',
                  ),
                ],
              ),
            ),
            _isProcessing
                ? Padding(
                    padding: const EdgeInsets.all(
                      16.0,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.orangeAccent,
                      ),
                    ),
                  )
                : Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Palette.mainBlueTheme,
                    ),
                    child: TextButton(
                      onPressed: () async {
                        widget.titleFocusNode.unfocus();
                        widget.descriptionFocusNode.unfocus();

                        if (_addItemFormKey.currentState.validate()) {
                          setState(
                            () {
                              _isProcessing = true;
                            },
                          );

                          await _postModel.updatePost(
                            postId: widget.documentId,
                            postImage: _postImageFile,
                            description: updateDescription,
                            location: updateLocation,
                          );

                          setState(
                            () {
                              _isProcessing = false;
                            },
                          );
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        'Cập nhật bài viết',
                        style: MobileTextTheme().kLargeButtonTextStyle,
                      ),
                    ),
                  ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
