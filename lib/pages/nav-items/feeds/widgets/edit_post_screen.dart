import 'package:flutter/material.dart';
import '/models/post.dart';
import '/theme/palette.dart';
import '/pages/nav-items/feeds/widgets/edit_post_form.dart';

class EditPostScreen extends StatefulWidget {
  final String documentId;
  final String currentUserID;
  final String currentImageUrl;
  final String currentDescription;
  final String currentLocation;

  EditPostScreen({
    this.documentId,
    this.currentUserID,
    this.currentImageUrl,
    this.currentDescription,
    this.currentLocation,
  });

  @override
  State<EditPostScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditPostScreen> {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  /// Connect to Post Manager model
  final PostModel _postModel = PostModel();

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
            style: TextStyle(fontWeight: FontWeight.w900),
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
                      setState(() {
                        _isDeleting = true;
                      });

                      /// Calling delete post method in Post Manager model
                      await _postModel.deletePost(
                        postId: widget.documentId,
                      );
                      setState(() {
                        _isDeleting = false;
                      });
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.delete_forever,
                      color: Palette.red,
                      size: 32,
                    ),
                  ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: EditItemForm(
              documentId: widget.documentId,
              currentImageUrl: widget.currentImageUrl,
              currentDescription: widget.currentDescription,
              currentLocation: widget.currentLocation,
              titleFocusNode: _titleFocusNode,
              descriptionFocusNode: _descriptionFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
