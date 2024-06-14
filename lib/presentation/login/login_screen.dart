import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:footballmanager/core/styles/app_colors.dart';
import 'package:footballmanager/core/styles/app_images.dart';
import 'package:footballmanager/core/styles/app_text_style.dart';
import 'package:footballmanager/presentation/login/components/rounded_btn.dart';
import 'package:footballmanager/presentation/login/login_controller.dart';
import 'package:footballmanager/shared/widget/app_bg_body_view.dart';
import 'package:get/get.dart';

import '../../core/routing/route_path.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showSpinner = false;

  late String email;
  late String password;
  LoginController loginController = LoginController.to;

  @override
  Widget build(BuildContext context) {
    return AppBgBodyView(
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          // backgroundColor: Color(0xff251F34),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                      width: 175,
                      height: 175,
                      child: SvgPicture.asset(AppImages.icnlogin)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 8),
                  child: Text(
                    'ĐĂNG NHẬP',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Đăng nhập để tiếp tục.',
                    style: AppTextStyles.bold13.copyWith(color: AppColors.bgWhiteLow5),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'TÀI KHOẢN',
                          style: AppTextStyles.bold16.copyWith(color: AppColors.bgWhite)
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          style: AppTextStyles.bold16.copyWith(color: AppColors.bgWhite),
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.white,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor:const Color(0xfff3B324E),
                            filled: true,
                            prefixIcon: Image.asset(AppImages.imgEmail),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.buttonBlue, width: 2.0),
                              borderRadius:
                                 const BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'MẬT KHẨU',
                          style: AppTextStyles.bold16.copyWith(color: AppColors.bgWhite),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        style: AppTextStyles.bold16.copyWith(color: AppColors.bgWhite),
                        obscureText: true,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: const Color(0xfff3B324E),
                          filled: true,
                          prefixIcon: Image.asset(AppImages.imgLock),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:AppColors.buttonBlue, width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: RoundedButton(
                        btnText: 'LOGIN',
                        color: AppColors.buttonBlue,
                        onPressed: () async {
                          // Get.offNamed(Routers.dashboard);
                          loginController.handleLogin(
                              userName: email, password: password);
                          setState(() {
                            showSpinner = true;
                          });

                          // email: email, password: password);
                          // if (user != null) {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => SuccessScreen()));
                        }),
                  ),
                ),
                Center(
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color(0xff14DAE2)),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account?',
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.w400),
                    ),
                    // FlatButton(
                    //   onPressed: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => CreateAccount()));
                    //   },
                    //   child: Text('Sign up',
                    //       style: TextStyle(
                    //         color: Color(0xff14DAE2),)
                    //   ),
                    // )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
