import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:ui';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_style.dart';

class AppDialogButton {
  final String text;
  final VoidCallback onPressed;

  AppDialogButton({required this.text, required this.onPressed});
}

/// {@template app_custom_dialog}
/// This widget to display the included dialog:
/// 1. title
/// 2. description
/// 3. List of button actions
/// The purpose of this dialog is to announce something
/// {@endtemplate}
class AppCustomDialog extends StatelessWidget {
  /// {@macro app_custom_dialog}
  const AppCustomDialog({
    Key? key,
    required this.title,
    this.description,
    this.bodyView,
    this.closeButton,
    this.isBackDefault = true,
    required this.confirmButton,
    this.color ,
  }) : super(key: key);

  final String title;
  final Color? color;
  final String? description;
  final Widget? bodyView;
  final AppDialogButton? closeButton;
  final AppDialogButton confirmButton;
  final bool isBackDefault;

  @override
  Widget build(BuildContext context) {
    final titleTextStyle =
    description != null ? AppTextStyles.bold16 : AppTextStyles.regular16;
    return Dialog(
      backgroundColor: AppColors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.tabbarBackgroud.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    '',
                    style:
                    AppTextStyles.bold24.copyWith(color: AppColors.bgWhite),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: titleTextStyle.copyWith(color: AppColors.bgWhite),
                    ),
                  ),
                  if (description != null)
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        description!,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.regular16
                            .copyWith(color: AppColors.bgWhite),
                      ),
                    ),
                  if (bodyView != null)
                    Container(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: bodyView!,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (closeButton != null)
                        _buildButton(
                          text: closeButton!.text,
                          onPressed: closeButton!.onPressed,
                          bgButtonColor: AppColors.bgWhiteWithOpacity(0.1),
                          isRightPadding: true,
                        ),
                      _buildButton(
                        text: confirmButton.text,
                        onPressed: confirmButton.onPressed,
                        bgButtonColor: color,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required Color? bgButtonColor,
    required VoidCallback onPressed,
    bool isRightPadding = false,
  }) {
    return Expanded(
      child: Container(
        margin: isRightPadding ? const EdgeInsets.only(right: 10) : null,
        child: ElevatedButton(
          onPressed: () {
            if (isBackDefault) {
              Get.back();
            }
            onPressed();
          },
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            elevation: 0,
            backgroundColor: bgButtonColor ?? AppColors.buttonBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          child: Text(
            text,
            style: AppTextStyles.bold16.copyWith(
              color: AppColors.bgWhite,
            ),
          ),
        ),
      ),
    );
  }
}
