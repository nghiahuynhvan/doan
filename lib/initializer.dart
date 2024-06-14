import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// [Initializer] initial for app
///
/// Functions include:
/// [init]
class Initializer {
  static final Initializer _singleton = Initializer._();

  /// Singleton
  static Initializer get instance => _singleton;

  Initializer._();

  /// First function to initialize the application, invoked automatically.
  /// 1. App has yet been initialized
  /// 2. Initial status bar
  /// 3. Waiting for window size to be initialized
  ///
  /// Parameters include:
  /// 1. [runApp] VoidCallBack type, function takes the given Widget
  /// and makes it the root of the widget tree.
  ///
  /// Return:
  ///  None: resolves if the application was successfully initialized.
  void init(runApp) {
    runZonedGuarded(() async {
      // Returns an instance of the binding that implements WidgetsBinding.
      WidgetsFlutterBinding.ensureInitialized();


      // TODO: - remove hard code
      // FirebaseAuth.instance.setLanguageCode(SLang.current.localeLanguage);



      runApp();
    }, (error, stack) {
      // AppLogger.instance.d('runZonedGuarded: ${error.toString()}');
    });
  }





}

/// function to listen to background changes
