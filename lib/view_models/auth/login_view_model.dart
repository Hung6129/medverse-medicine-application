import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/widgets/awesome_dialog.dart';
import '/theme/palette.dart';
import '/screens/mainscreen.dart';
import '/services/auth_service.dart';
import '/utils/validation.dart';
import '/utils/app_text_theme.dart';

class LoginViewModel extends ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool validate = false;
  bool loading = false;
  String email, password;
  FocusNode emailFN = FocusNode();
  FocusNode passFN = FocusNode();
  AuthService auth = AuthService();

  login(BuildContext context) async {
    FormState form = formKey.currentState;
    form.save();
    if (!form.validate()) {
      validate = true;
      notifyListeners();
      AwesomeDialog(
        autoHide: Duration(seconds: 3),
        btnCancelColor: Palette.warningColor,
        context: context,
        dialogType: DialogType.ERROR,
        headerAnimationLoop: false,
        animType: AnimType.TOPSLIDE,
        showCloseIcon: true,
        closeIcon: const Icon(Icons.close_fullscreen_outlined),
        title: 'Thông báo!',
        desc: 'Vui lòng hoàn thành điền thông tin trước khi đăng nhập. ',
        descTextStyle: AppTextTheme.oswaldTextStyle,
        btnCancelOnPress: () {},
        btnCancelText: 'Hủy bỏ',
      ).show();
    } else {
      loading = true;
      notifyListeners();
      try {
        bool success = await auth.loginUser(
          email: email,
          password: password,
        );
        print(success);
        if (success) {
          Navigator.of(context).pushReplacement(
            CupertinoPageRoute(
              builder: (context) => TabScreen(),
            ),
          );
          showActiveInSnackBar(
            'Đăng nhập thành công',
            context,
          );
        }
      } catch (e) {
        loading = false;
        notifyListeners();
        print(e);
        showErrorInSnackBar(
            '${auth.handleFirebaseAuthError(e.toString())}', context);
      }
      loading = false;
      notifyListeners();
    }
  }

  forgotPassword(BuildContext context) async {
    loading = true;
    notifyListeners();
    FormState form = formKey.currentState;
    form.save();
    print(Validations.validateEmail(email));
    if (Validations.validateEmail(email) != null) {
      showErrorInSnackBar(
        'Hãy nhập Email hợp lệ để lấy lại mật khẩu',
        context,
      );
    } else {
      try {
        await auth.forgotPassword(email);
        showErrorInSnackBar(
          'Vui lòng kiểm tra email của bạn để được hướng dẫn '
          'đặt lại mật khẩu',
          context,
        );
      } catch (e) {
        showErrorInSnackBar(
          '${e.toString()}',
          context,
        );
      }
    }
    loading = false;
    notifyListeners();
  }

  setEmail(val) {
    email = val;
    notifyListeners();
  }

  setPassword(val) {
    password = val;
    notifyListeners();
  }

  /// This message will show when validation is failed
  void showErrorInSnackBar(String value, context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          value,
          style: GoogleFonts.oswald(),
        ),
        backgroundColor: Palette.red,
      ),
    );
  }

  /// This message will show when validation is successful
  void showActiveInSnackBar(String value, context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          value,
          style: GoogleFonts.oswald(),
        ),
        backgroundColor: Palette.activeButton,
      ),
    );
  }
}
