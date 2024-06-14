import 'package:get/get.dart';

import '../../presentation/splash_screen/splash_controller.dart';


class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
