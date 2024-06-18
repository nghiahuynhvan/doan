
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:footballmanager/core/styles/app_images.dart';
import 'package:footballmanager/presentation/home/home_controller.dart';
import 'package:footballmanager/presentation/login/components/rounded_btn.dart';
import 'package:footballmanager/presentation/login/login_controller.dart';
import 'package:get/get.dart';

import '../login_screen.dart';


class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  LoginController loginController = LoginController.to;
  bool showSpinner = false;
  late String username;
  late String password;
  late String fullname;
  late String email;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: _goBackButton(context),
        backgroundColor: Color(0xff251F34),
      ),
      backgroundColor: Color(0xff251F34),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: Text('Create Account',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 25
                ),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Please fill the input below.',
                style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                ),),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Họ và tên',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    style: (TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400
                    )),
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xfff3B324E),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff14DAE2), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    onChanged: (value) {
                      fullname = value;
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    style: (TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400
                    )),
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xfff3B324E),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff14DAE2), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Tên tài khoản',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    style: (TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400
                    )),
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xfff3B324E),
                      filled: true,
                      prefixIcon: Image.asset(AppImages.imgEmail),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff14DAE2), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    onChanged: (value) {
                      username = value;
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Mật khẩu',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    style: (TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400
                    )),
                    obscureText: true,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xfff3B324E),
                      filled: true,
                      prefixIcon: Image.asset(AppImages.imgLock),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff14DAE2), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                  btnText: 'Đăng kí',
                  color: Color(0xff14DAE2),
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      loginController.handeRegister(fullname, email, username, password);
                      print('!!!!Success');
                    } catch (e) {
                      print(e);
                    }
                    // Add login code
                  },
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Bạn đã có tài khoản?',
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400
                  ),),
                GestureDetector(
                  onTap: () {
                   Get.to(Login());
                  },
                  child: Text('Đăng Nhập',
                      style: TextStyle(
                        color: Color(0xff14DAE2),)
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget _goBackButton(BuildContext context) {
  return IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.grey[350]),
      onPressed: () {
        Navigator.of(context).pop(true);
      });
}
