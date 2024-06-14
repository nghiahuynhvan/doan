import 'package:flutter/material.dart';
import 'package:footballmanager/core/styles/app_font_family.dart';

class AppTextStyles {
  AppTextStyles._();

  //regular
  static final TextStyle regular100 = regularStyle.copyWith(fontSize: 100);

  static final TextStyle regular32 = regularStyle.copyWith(fontSize: 32);

  static final TextStyle regular18 = regularStyle.copyWith(fontSize: 18);

  static final TextStyle regular16 = regularStyle.copyWith(fontSize: 16);

  static final TextStyle regular14 = regularStyle.copyWith(fontSize: 14);

  static final TextStyle regular13 = regularStyle.copyWith(fontSize: 13);

  static final TextStyle regular11 = regularStyle.copyWith(fontSize: 11);

  //bold
  static final TextStyle bold120 = boldStyle.copyWith(fontSize: 120);

  static final TextStyle bold100 = boldStyle.copyWith(fontSize: 100);

  static final TextStyle bold32 = boldStyle.copyWith(fontSize: 32);

  static final TextStyle bold26 = boldStyle.copyWith(fontSize: 26);

  static final TextStyle bold24 = boldStyle.copyWith(fontSize: 24);

  static final TextStyle bold22 = boldStyle.copyWith(fontSize: 22);

  static final TextStyle bold20 = boldStyle.copyWith(fontSize: 20);

  static final TextStyle bold19 = boldStyle.copyWith(fontSize: 19);

  static final TextStyle bold18 = boldStyle.copyWith(fontSize: 18);

  static final TextStyle bold16 = boldStyle.copyWith(fontSize: 16);

  static final TextStyle bold15 = boldStyle.copyWith(fontSize: 15);

  static final TextStyle bold14 = boldStyle.copyWith(fontSize: 14);

  static final TextStyle bold13 = boldStyle.copyWith(fontSize: 13);

  static final TextStyle bold11 = boldStyle.copyWith(fontSize: 11);

  //small
  static final TextStyle small11 = smallStyle.copyWith(fontSize: 11);

  static final TextStyle small13 = smallStyle.copyWith(fontSize: 13);

  static final TextStyle boldStyle = _textStyle.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final TextStyle regularStyle = _textStyle.copyWith(
    fontWeight: FontWeight.w500,
  );

  static final TextStyle smallStyle = _textStyle.copyWith(
    fontWeight: FontWeight.w400,
  );

  static final TextStyle _textStyle = TextStyle(
    fontFamily: AppFontFamily().getFontFamily(),
  );
}
