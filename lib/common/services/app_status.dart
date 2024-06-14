import 'dart:io';
//import 'dart:js';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../app_errors/app_orther_error.dart';
import '../constants/app_constants.dart';
import '../logger/app_logger.dart';

/// [AppStatus] extension
class AppStatus {
  AppStatus._();

  /// The app is already inside and is being used by the user
  /// Begin Splash screen
  ///
  /// Default is false: not already in side app
  static bool appIsAlreadyInside = true;

  /// Screen util lib
  static final ScreenUtil _deviceType = ScreenUtil();

  static late PackageInfo packageInfo;

  /// Call to get package info by platform
  static Future<void> initPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  static Future<String?> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }
    return null;
  }

  /// Call [showDialog] if app need to show dialog view
  static void showDialog({
    required Widget child,
    Alignment alignment = Alignment.bottomCenter,
    String? tag,
  }) {
    _showDialog(child: child, alignment: alignment, tag: tag);
  }

  /// Call [showLoading] if app need to show progress view
  /// and change app state become AppStatusLoading
  /// Call [showToast] if app need to show toast view
  /// and change app state become AppStatusLoading
  static void showToast(
      String message, {
        Duration? displayTime,
        bool? clickMaskDismiss,
        double? paddingBottom,
      }) {

  }

  /// Call [dismissLoading] if app need to dismiss only loading
  static void dismissLoading() {
    if (appIsAlreadyInside) _dismissLoading();
  }

  /// Call [dismissLoading] if app need to dismiss progress view
  /// and change app state become AppStatusDone
  /// The state of is done all of states.
  /// if progress view is showing -> Close progress
  /// if any errors state -> Close errors warning dialog or alert
  static void dismissAllStatus({
    SmartStatus status = SmartStatus.smart,
    String? tag,
  }) {
    if (appIsAlreadyInside) SmartDialog.dismiss(status: status, tag: tag);
  }

  /// Set status app is already inside app screen's & is being used by the user
  /// Begin Splash screen
  static void setStatusAppAlreadyInside({required bool isReadyInside}) {
    AppLogger.instance.d("Set status app already inside: $isReadyInside");
    appIsAlreadyInside = isReadyInside;
  }

  /// Set exception occur when request API
  ///
  /// Usually SocketException error or exception timeout
  /// It can not connect to server
  static void exceptionConnectServer({
    required AppOtherError error,
  }) {
    AppLogger.instance.d("Occur exception error: ${error.exception}");
    if (appIsAlreadyInside) {
      dismissLoading();
      _showDialog(child: Text(error.messageError));
    }
  }

  /// Call [appShowDisconnectNetwork] if app need to show alert dialog view
  /// with message and dialog, to notify the user about lost connection
  /// internet


  /// Call [isShowingDisconnectNetwork] If you want to check if it's showing
  /// Does the dialog have the tag [AppConstants.tagNameAlertDisconnect] or not

  static void _showDialog({
    required Widget child,
    Alignment alignment = Alignment.bottomCenter,
    String? tag,
  }) {
    if (SmartDialog.config.custom.isExist) return;
    SmartDialog.show(
      tag: tag,
      debounce: true,
      clickMaskDismiss: false,
      alignment: alignment,
      animationTime: const Duration(milliseconds: 250),
      builder: (context) {
        return child;
      },
    );
  }


  static void _dismissLoading() {
    SmartDialog.dismiss(status: SmartStatus.loading);
  }

  /// Check if the current app is a tablet device
  static bool isTablet(BuildContext context) {
    return _deviceType.deviceType(context) == DeviceType.tablet;
  }

  /// Check if the current app is a mobile device
  static bool isMobile(BuildContext context) {
    return _deviceType.deviceType(context) == DeviceType.mobile;
  }

  /// Checking is showing keyboard
  static bool isOpenKeyboard(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom != 0;
  }

  /// Closing keyboard is showing
  static void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
