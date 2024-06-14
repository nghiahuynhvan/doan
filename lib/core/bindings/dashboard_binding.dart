import 'package:get/get.dart';

import '../../presentation/dashboard/dashboard_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies()
  {
    Get.put<MyDashBoardController>(MyDashBoardController());
  }
}