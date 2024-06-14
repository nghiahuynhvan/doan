import 'package:get/get.dart';

class MyDashBoardController extends GetxController {
  static MyDashBoardController get to => Get.find();
  var tabIndex = 0;
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}