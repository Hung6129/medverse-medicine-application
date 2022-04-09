import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:medverse_mobile_app/theme/palette.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import '/auth/register/register.dart';
import '/components/password_text_field.dart';
import '/components/text_form_builder.dart';
import '/utils/validation.dart';
import '/view_models/auth/login_view_model.dart';
import '/widgets/indicators.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = Provider.of<LoginViewModel>(context);

    return ModalProgressHUD(
      progressIndicator: circularProgress(context),
      inAsyncCall: viewModel.loading,
      child: Scaffold(
        backgroundColor: Colors.white,
        key: viewModel.scaffoldKey,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          children: [
            SizedBox(height: 60.0),
            Container(
              height: 170.0,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/login.png',
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'Chào mừng bạn đã trở lại!',
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.w900,
                  color: Palette.textNo,
                ),
              ),
            ),
            Center(
              child: Text(
                'Đăng nhập tài khoản để bắt đầu!',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                  color: Palette.textNo,
                ),
              ),
            ),
            SizedBox(height: 25.0),
            buildForm(context, viewModel),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bạn chưa có tài khoản?',
                  style: TextStyle(
                    color: Palette.textNo,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (_) => Register()));
                  },
                  child: Text(
                    'Đăng ký',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.mainBlueTheme,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildForm(BuildContext context, LoginViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormBuilder(
            enabled: !viewModel.loading,
            prefix: Feather.mail,
            hintText: "Email tài khoản",
            textInputAction: TextInputAction.next,
            validateFunction: Validations.validateEmail,
            onSaved: (String val) {
              viewModel.setEmail(val);
            },
            focusNode: viewModel.emailFN,
            nextFocusNode: viewModel.passFN,
          ),
          SizedBox(height: 15.0),
          PasswordFormBuilder(
            enabled: !viewModel.loading,
            prefix: Feather.lock,
            suffix: Feather.eye,
            hintText: "Mật khẩu",
            textInputAction: TextInputAction.done,
            validateFunction: Validations.validatePassword,
            submitAction: () => viewModel.login(context),
            obscureText: true,
            onSaved: (String val) {
              viewModel.setPassword(val);
            },
            focusNode: viewModel.passFN,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: InkWell(
                onTap: () => viewModel.forgotPassword(context),
                child: Container(
                  width: 130,
                  height: 40,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Quên mật khẩu?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            height: 45.0,
            width: 180.0,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Palette.mainBlueTheme,
                ),
              ),
              // highlightElevation: 4.0,
              child: Text(
                'Đăng nhập',
                style: TextStyle(
                  color: Palette.whiteText,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () => viewModel.login(context),
            ),
          ),
        ],
      ),
    );
  }
}
