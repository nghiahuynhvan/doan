import 'dart:async';

import 'package:get/get.dart';

import '../../core/routing/route_path.dart';

class SplashController extends GetxController {
  SplashController();

  static SplashController get to => Get.find();

  @override
  void onInit() {
    _handleStartInApp();
    super.onInit();
  }

  void _handleStartInApp() {
    Timer(const Duration(seconds: 1), () {
      Get.offNamed(Routers.login);
    });
  }
}
